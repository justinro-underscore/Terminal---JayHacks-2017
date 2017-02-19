Dirt=  {}

function Dirt:new(x,y)
  o={}
  setmetatable(o,{__index = self})
  o.position = vector.new(x,y)
  return o
end

function Dirt:draw()
  love.graphics.draw(dirtImage,self.position.x, self.position.y)
end
