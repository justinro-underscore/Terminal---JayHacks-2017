door = {}

function door:new(x,y) --Creates the door
  o={}
  setMetaTable(o, {__index = self})

  o.position = vector.new(x,y) -- The position of the door
  o.size = vector.new(1,2) -- The size of the door
  o.bool = true -- checks if the door is open or closed
  return o
end

function door:draw() --Will Brabston told us to draw the door
  love.graphics.rectangle(door, o.position.x, o.position.y,o.size.x, o.size.y)

end



function door:open() -- changes the door to open
  love.graphics.rectangle(openeddoor, o.position.x, o.position.y, o.size.x, o.size.y)
  o.bool = false -- checks if the door is open or not
end

function door:check() -- returns the door.
    return o.bool
end
