dirt=  {}

function dirt:new(x,y)
  o={}
  setmetatable(o,{__index = self})
  o.position = vector.newCanvas(x,y)
  return o
end

function dirt:draw()
  love.graphics.draw(dirt,self.position.x, self.position.y)
end
