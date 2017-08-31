local MotionSystem = class("MotionSystem", System)

function MotionSystem:update(dt)
   for i, v in pairs(self.targets) do
      v:get("Position").x = v:get("Position").x + v:get("Speed").speed * dt
   end
end

function MotionSystem:requires()
    return {"Position", "Speed"}
end

return MotionSystem
