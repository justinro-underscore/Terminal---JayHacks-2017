Bullet = {}

function Bullet:new(x, y, xVel, yVel)
	local o = {}
	setmetatable(o, {__index = self})

	o.position = vector.new(x, y)
	o.radius = 4
	o.velocity = vector.new(xVel, yVel)


	o.collider = HC.circle(o.position.x, o.position.y, o.radius)
	o.collider.parent = o -- used so that colliders can find their parent object

	o.tag = "Bullet" -- used for other objects to find out what kind of object this is

	o.isKill = false
	return o
end

function Bullet:update(dt)
  self:collide()

  self.position = self.position + (self.velocity * dt)

  self.collider:moveTo(self.position.x, self.position.y)

  if self.isKill then
    self:delete()
  end
end

function Bullet:collide()
	for other, delta in pairs(HC.collisions(self.collider)) do
		local otherParent = other.parent

		if otherParent.tag == "Wall" then
      self.isKill = true
    elseif otherParent.tag == "Spy" then
      self.isKill = true
      if not (otherParent.mode == "defense") then
				otherParent.isKill = true
			end -- sloppy hack because we ran out of time
    elseif otherParent.tag == "VBoxOn" then
      self.isKill = true
    elseif otherParent.tag == "Trap" then
      self.isKill = true
    elseif otherParent.tag == "Door" then
      self.isKill = true
    end
  end
end

function Bullet:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.circle("fill", self.position.x, self.position.y, self.radius, 6)
end

function Bullet:delete()
  HC.remove(self.collider)
end
