local InfiniteDrawSystem = class("InfiniteDrawSystem", System)

function InfiniteDrawSystem:draw()
   for i, v in pairs(self.targets) do
      local position = v:get("Position")
      local img      = v:get("Drawable").img
      local size     = v:get("Drawable").size

      love.graphics.translate(-camera.x, -camera.y)

      x = math.floor(camera.x / (position.x + size.w)) * size.w
      love.graphics.draw(img, x, position.y)
      love.graphics.draw(img, x + size.w, position.y)
      love.graphics.draw(img, x + 2 * size.w, position.y)
   end
end

function InfiniteDrawSystem:requires()
    return {"Position", "Drawable"}
end

return InfiniteDrawSystem
