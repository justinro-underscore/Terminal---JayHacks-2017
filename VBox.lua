VBox = {}

function VBox:new(x,y,activated)
  local o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x, y) -- places the position vector
  o.size = vector.new(64, 64)

  o.activated = activated

	o.collider = HC.rectangle(o.position.x - o.size.x / 2, o.position.y - o.size.x / 2, o.size.x, o.size.y)
	o.collider.parent = o -- used so that colliders can find their parent object
	o.tag = ""
  if activated then
    o.tag = "VBoxOn"
  else
    o.tag = "VBoxOff"
  end

  return o
end

function VBox:toggleStage()
  if self.activated then
    self.activated = false
    self.tag = "VBoxOff"
  else
    self.activated = true
    self.activated = "VBoxOn"
  end
end

function VBox:draw()
  if self.activated then
    love.graphics.setColor(125, 125, 125)
  else
    love.graphics.setColor(125, 125, 125, 125)
  end
  love.graphics.rectangle("fill" , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y) -- Places the rectangle.
end
