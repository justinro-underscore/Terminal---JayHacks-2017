Door = {}

function Door:new(x,y) --Creates the door
  local o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x,y) -- The position of the door
  o.size = vector.new(32, 96) -- The size of the door
  o.isOpen = false -- bool holds if the door is open or closed

  o.collider = HC.rectangle(o.position.x - o.size.x / 2, o.position.y - o.size.x / 2, o.size.x, o.size.y)
  o.collider.parent = o -- used so that colliders can find their parent object
  o.tag = "Door"

  return o
end

function Door:toggle()
  if self.isOpen then
    self.isOpen = false
    self.tag = "DoorClosed"
  else
    self.isOpen = true
    self.tag = "DoorOpen"
  end
end

function Door:draw() --Will Brabston told us to draw the door
  if isOpen then
    love.graphics.setColor(155, 155, 155, 155)
  else
    love.graphics.setColor(155, 155, 155)
	end
  love.graphics.rectangle("fill", self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y)
end
