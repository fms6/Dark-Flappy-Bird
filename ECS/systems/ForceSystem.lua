local ForceSystem = class("ForceSystem", System)

function ForceSystem:update(dt)
   for i, v in pairs(self.targets) do
      v:get("Position").y = v:get("Physic").body:getY()
      if love.keyboard.isDown("right") then
         v:get("Physic").body:applyForce(1000, 0)
      elseif love.keyboard.isDown("left") then
         v:get("Physic").body:applyForce(-1000, 0)
      end
      if love.keyboard.isDown("space") then
         v:get("Physic").body:applyForce(0, -1800)
      elseif love.keyboard.isDown("down") then
         v:get("Physic").body:applyForce(0, 1000)
      end
      love.graphics.print(v:get("Physic").body:getY(), camera.x)
   end

end

function ForceSystem:requires()
    return {"Physic", "Position"}
end

return ForceSystem
