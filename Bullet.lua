Bullet = {}

function Bullet:new(x,y)
  o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x,y)
  o.size = vector.new(16, 16)
  o.facing = "right"

  o.VELOCITY_CONSTANT = 200

  return o
end

function Bullet:update(dt)
  if self.facing == "right" then
    self.position.x = self.position.x + (self.VELOCITY_CONSTANT * dt)
  else
    self.position.x = self.position.x - (self.VELOCITY_CONSTANT * dt)
  end
end

function Bullet:draw()
	love.graphics.setColor(255, 0, 255)
  love.graphics.rectangle("fill" , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y)
end
