lovetoys = require("lib/lovetoys/lovetoys")
anim8    = require("lib/anim8/anim8")

lovetoys.initialize({
    globals = true,
    debug = true
})

require ("ECS/components/Image")
require ("ECS/components/Position")
require ("ECS/components/Anim8")
require ("ECS/components/Speed")
require ("ECS/components/Physic")

camera = require ("modules/camera")

ImageDrawSystem      = require("ECS/systems/ImageDrawSystem")
Anim8DrawSystem      = require("ECS/systems/Anim8DrawSystem")
Anim8UpdateSystem    = require("ECS/systems/Anim8UpdateSystem")
InfiniteDrawSystem   = require("ECS/systems/InfiniteDrawSystem")
MotionSystem         = require("ECS/systems/MotionSystem")
ForceSystem          = require("ECS/systems/ForceSystem")

local Physic, Anim8, Speed, Position, Image = Component.load({"Physic", "Anim8", "Speed", "Position", "Image"})

width = love.graphics.getWidth()
height = love.graphics.getHeight()

function create_scenario()
   scenario_entity = Entity()
   scenario_entity:add(Position(0, 0))
   scenario_entity:add(Image({path="media/img/scenario/background.png"}))
   scenario = Engine()
   scenario:addSystem(InfiniteDrawSystem())
   scenario:addEntity(scenario_entity)
   return scenario
end

function create_scenario()
   scenario_entity = Entity()
   scenario_entity:add(Position(0, 0))
   scenario_entity:add(Image({path="media/img/scenario/background.png"}))
   scenario = Engine()
   scenario:addSystem(InfiniteDrawSystem())
   scenario:addEntity(scenario_entity)
   return scenario
end

function create_floor()
   floor_entity = Entity()
   floor_entity:add(Position(0, height - 77))
   floor_entity:add(Image({path="media/img/scenario/floor2.png", oy=-77}))
   floor = Engine()
   floor:addSystem(InfiniteDrawSystem())
   floor:addEntity(floor_entity)
   return floor
end

function create_bat()
   b = love.physics.newBody(world, 0, 20, "dynamic")
   b:setMass(3)

   s = love.physics.newCircleShape(50)

   f = love.physics.newFixture(b, s)
   f:setRestitution(0.4)    -- make it bouncy
   f:setUserData("Ball")

   bat_entity = Entity()
   bat_entity:add(Physic(b, s, f))
   bat_entity:add(Position(0, 60))
   bat_entity:add(Speed(100))
   bat_entity:add(Image({path="media/img/sprites/bat.png"}))
   bat_entity:add(Anim8({w = 210, h = 150}, bat_entity:get("Image").size, "1-6", 0.02))

   bat = Engine()
   bat:addSystem(MotionSystem())
   bat:addSystem(Anim8DrawSystem())
   bat:addSystem(Anim8UpdateSystem())
   bat:addSystem(ForceSystem())
   bat:addEntity(bat_entity)
   return bat
end

function love.load()
   world = love.physics.newWorld(0, 80, true)
   world:setCallbacks(beginContact, endContact, preSolve, postSolve)
   love.graphics.setBackgroundColor(255, 255, 255)
   scenario = create_scenario()
   floor = create_floor()
   bat = create_bat()

end

function love.update(dt)
   world:update(dt)
   bat:update(dt)
   _G.camera:move(100 * dt, 0 )

end

function love.draw()
   camera:set(camera.x, camera.y)
   scenario:draw()
   bat:draw()
   floor:draw()
   camera.unset()

end

-- debug

function beginContact(a, b, coll)
    x,y = coll:getNormal()
    text = text.."\n"..a:getUserData().." colliding with "..b:getUserData().." with a vector normal of: "..x..", "..y
end

function endContact(a, b, coll)
    persisting = 0
    text = text.."\n"..a:getUserData().." uncolliding with "..b:getUserData()
end

function preSolve(a, b, coll)
    if persisting == 0 then    -- only say when they first start touching
        text = text.."\n"..a:getUserData().." touching "..b:getUserData()
    elseif persisting < 20 then    -- then just start counting
        text = text.." "..persisting
    end
    persisting = persisting + 1    -- keep track of how many updates they've been touching for
end

function postSolve(a, b, coll, normalimpulse, tangentimpulse)
end
