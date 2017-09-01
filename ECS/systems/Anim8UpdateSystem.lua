local Anim8UpdateSystem = class("Anim8UpdateSystem", System)

function Anim8UpdateSystem:update(dt)
   for i, v in pairs(self.targets) do
      local anim = v:get("Anim8").anim
      anim:update(dt)

   end
end

function Anim8UpdateSystem:requires()
    return {"Anim8"}
end

return Anim8UpdateSystem
