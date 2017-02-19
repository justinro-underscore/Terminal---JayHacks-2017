VBox = {}

function VBox:new(x,y,activated,name)
  local o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x, y) -- places the position vector
  o.size = vector.new(64, 64)
  o.name = name
  o.sprite = love.graphics.newImage("Spy Game Sprites/Steel Wall.png")

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

function VBox:toggle()
  local result = ""
  if self.activated then
    self.activated = false
    self.tag = "VBoxOff"
    result = self.name .. " has been turned to the OFF state"
  else
    self.activated = true
    self.tag = "VBoxOn"
    result = self.name .. " has been turned to the ON state"
  end
  return result
end

function VBox:draw()
  if self.activated then
    love.graphics.setColor(125, 125, 125, 255)
  else
    love.graphics.setColor(125, 125, 125, 100)
  end
  love.graphics.draw(self.sprite , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, 0, 2, 2) -- Places the sprite.
end
