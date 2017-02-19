Terminal = {}

function Terminal:new(x, y, name, unlocked, password)
  local o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x,y)
  o.size = vector.new(32, 64)
  o.terminalName = name
  o.terminalPassword = password
  o.unlocked = unlocked

  o.sprite = love.graphics.newImage("Spy Game Sprites/Terminal Console Command.png")

  o.accessible = false

	o.collider = HC.rectangle(x, y, o.size.x, o.size.y)
	o.collider.parent = o -- used so that colliders can find their parent object
  o.tag = "Terminal" -- used for other objects to find out what kind of object this is

  o.information = {}
  o.influence = {}

  return o
end

function Terminal:addInfo(info)
  table.insert(self.information, info)
end

function Terminal:addInfluence(object)
  table.insert(self.influence, object)
end

function Terminal:unlock()
  self.unlocked = true
  return self.information
end

function Terminal:draw()
  love.graphics.draw(self.sprite , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, 0, 2, 2) -- Places the sprite.

  if hackerList[1] and hackerList[1].currentTerminal and hackerList[1].currentTerminal == self then
    love.graphics.setFont(hackerFont)
    for _, v in ipairs(self.influence) do
      love.graphics.setColor(0, 255, 0, 120)
      love.graphics.line(self.position.x, self.position.y, v.position.x, v.position.y)
      love.graphics.setColor(0, 255, 0)
      love.graphics.print(v.name, v.position.x - string.len(v.name) * 4, v.position.y + v.size.y / 2)
    end
  end
end
