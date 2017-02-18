wall = {}
function wall:new(x,y) -- creates a new wall class and places it in an intial position
  o = {}
  setMetaTable(o, {__index = self})

  o.position = vector.new(x,y) -- places the position vector
  o.size = vector.new (32,32) -- the actual size of the wall

  return o
end

function wall:collision()
end

function wall:draw()
  love.graphics.rectangle("fill",o.position.x, o.position.y, o.size.x, o.size.y) -- Places the rectangle.
end
