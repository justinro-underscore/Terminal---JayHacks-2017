Bullet = {}

function Bullet:new(x, y, velocity_x, velocity_y)
  o = {}
  setmetatable(o,{__index = self})
  o.raduis = 8
  o.position = vector.new(x,y)
  o.velocity = velocity.new(velocity_x,velocity_y)

  o.collider = HC.circle(x, y, o.radius)
	o.collider.parent = o -- used so that colliders can find their parent object

	o.tag = "Spy" -- used for other objects to find out what kind of object this is

	o.isKill = false

  return o
end

function Bullet:update(dt)
  self.position = self.position + self.velocity * dt
end

function Bullet:draw()
  love.graphics.circle("fill", self.position.x, self.position.y, 8, 8)
end

function Bullet:collision()

end

function Bullet:kill()

end
