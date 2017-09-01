local Anim8  = Component.create("Anim8")

function Anim8:initialize(grid, size, frames, time)
   self.size  = {}
   self.size.w = grid.w
   self.size.h = grid.h
   g = anim8.newGrid(grid.w, grid.h, size.w, size.h)
   self.anim = anim8.newAnimation(g(frames, 1), time)
end
