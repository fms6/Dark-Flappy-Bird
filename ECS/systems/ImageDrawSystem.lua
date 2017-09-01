local ImageDrawSystem = class("ImageDrawSystem", System)

function ImageDrawSystem:draw()
   for i, v in pairs(self.targets) do
      local position = v:get("Position")
      local img      = v:get("Image").img

      love.graphics.draw(img, position.x, position.y)

   end
end

function ImageDrawSystem:requires()
    return {"Position", "Image"}
end

return ImageDrawSystem
