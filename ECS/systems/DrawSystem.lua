local DrawSystem = class("DrawSystem", System)

function DrawSystem:draw()
   for i, v in pairs(self.targets) do
      local position = v:get("Position")
      local img      = v:get("Drawable").img

      love.graphics.translate(-camera.x, -camera.y)
      love.graphics.draw(img, position.x, position.y)
   end
end

function DrawSystem:requires()
    return {"Position", "Drawable"}
end

return DrawSystem
