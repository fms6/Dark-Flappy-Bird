local Anim8DrawSystem = class("Anim8DrawSystem", System)

function Anim8DrawSystem:draw()
   for i, v in pairs(self.targets) do
      local position = v:get("Position")
      local img      = v:get("Image").img
      local anim     = v:get("Anim8").anim

      anim:draw(img, position.x, position.y)

   end
end

function Anim8DrawSystem:requires()
    return {"Position", "Image", "Anim8"}
end

return Anim8DrawSystem
