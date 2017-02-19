Turret = {}

function Turret:new(x,y,facing)
  o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x,y)
  o.size = vector.new(32, 64)
  o.facing = facing

  o.time = 0
  o.count = 0

  return o
end

function Turret:update(dt)
  self.time = self.time + dt
  if self.time >= 0.5 then
    if self.count == 3 then
      if self.time < 1.5 then
        return nil
      end
      self.count = 0
      self.time = self.time - 1
    end
    if self.facing == "right" then
      table.insert(bulletList,Bullet:new(self.position.x + self.size.x / 2, self.position.y, self.facing))
    else
      table.insert(bulletList,Bullet:new(self.position.x - self.size.x / 2, self.position.y, self.facing))
    end
    self.count = self.count + 1
    self.time = self.time - 0.5
  end
end

function Turret:draw()
	love.graphics.setColor(255, 255, 0)
  love.graphics.print(self.time)
  love.graphics.rectangle("fill" , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y)
end
