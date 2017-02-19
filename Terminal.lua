Terminal = {}

function Terminal:new(x, y, name, unlocked, password)
  local o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x,y)
  o.size = vector.new(32, 64)
  o.terminalName = name
  o.terminalPassword = password
  o.unlocked = unlocked

  o.accessible = false

	o.collider = HC.rectangle(x, y, o.size.x, o.size.y)
	o.collider.parent = o -- used so that colliders can find their parent object
  o.tag = "Terminal" -- used for other objects to find out what kind of object this is

  o.information = {}

  return o
end

function Terminal:addInfo(info)
  table.insert(self.information, info)
end

function Terminal:unlock()
  self.unlocked = true
  return self.information
end

function Terminal:draw()
  if self.unlocked then
    love.graphics.setColor(0, 0, 255)
  else
	  love.graphics.setColor(53, 64, 124)
  end
  love.graphics.rectangle("fill" , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y) -- Places the rectangle.
end
