local Drawable  = Component.create("Drawable")

function Drawable:initialize(img_path)
   self.img   = love.graphics.newImage(img_path)
   self.size  = {}
   self.size.w = self.img:getWidth()
   self.size.h = self.img:getHeight()
end
