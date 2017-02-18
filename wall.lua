Wall = {}

function Wall:new(x, y) -- creates a new wall class and places it in an intial position
  local o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x, y) -- places the position vector
  o.size = vector.new(32, 32) -- the actual size of the wall
	
	o.collider = HC.rectangle(o.position.x - o.size.x / 2, o.position.y - o.size.x / 2, o.size.x, o.size.y)
	o.collider.parent = o -- used so that colliders can find their parent object
	o.tag = "Wall"
	
  return o
end

function Wall:draw()
	love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill" , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y) -- Places the rectangle.
	love.graphics.setColor(255, 0, 0)
	self.collider:draw()
end
