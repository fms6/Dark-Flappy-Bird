local Image  = Component.create("Image")

function Image:initialize(params)
   self.img    = love.graphics.newImage(params.path)
   self.size   = {}
   self.size.w = self.img:getWidth()
   self.size.h = self.img:getHeight()
   self.r      = params.r or 0
   self.ox     = params.ox or 0
   self.oy     = params.oy or 0
   self.sx     = params.sx or 1
   self.sy     = params.sy or 1
end
