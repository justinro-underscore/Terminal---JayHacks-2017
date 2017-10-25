Trap ={}
function Trap:new(x,y)
  local o  ={}
  setmetatable(o, {__index=self})
  o.position = vector.new(x,y)
  o.size = vector.new(96,32)
  return o
end

function Trap:draw()
  love.graphics.rectangle("fill", self.position.x, self.position.y, self.size.x, self.size.y)
end
--WTF.
