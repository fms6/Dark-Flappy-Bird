lovetoys = require("lib/lovetoys/lovetoys")
lovetoys.initialize({
    globals = true,
    debug = true
})

require ("ECS/components/Drawable")
require ("ECS/components/Position")
require ("ECS/components/Speed")

_G.camera = require ("modules/camera")

DrawSystem           = require("ECS/systems/DrawSystem")
InfiniteDrawSystem   = require("ECS/systems/InfiniteDrawSystem")
MotionSystem         = require("ECS/systems/MotionSystem")

local Speed, Position, Drawable = Component.load({"Speed", "Position", "Drawable"})

function love.load()

   scenario = Entity()
   scenario:add(Position(0, 0))
   scenario:add(Drawable("media/img/scenario/background.png"))

   engine = Engine()
   engine:addSystem(InfiniteDrawSystem())
   engine:addEntity(scenario)

   player = Entity()
   player:add(Speed(100))
   player:add(Position(0, 0))

   --scenario:add(Drawable("media/img/scenario/.png"))

   engine2 = Engine()
   engine2:addSystem(MotionSystem())
   engine2:addEntity(scenario)

end

function love.update(dt)

   engine:update(dt)
   engine2:update(dt)

   _G.camera:move(100 * dt, 0 )

end

function love.draw()
   engine:draw()
end
