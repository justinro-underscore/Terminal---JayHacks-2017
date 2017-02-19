Spy = {}

function Spy:new(x, y, controller)
	local o = {}
	setmetatable(o, {__index = self})

	o.position = vector.new(x, y)
	o.size = vector.new(64, 96)
	o.velocity = vector.new(0, 0)

	o.controller = controller

	--[[
	possible state values:
	-ground
	-air
	]]
	o.state = "air"

	o.mode = "none"

	o.hitGround = false -- will be set to true by the collision function, used by changestate

	o.collider = HC.rectangle(x, y, o.size.x, o.size.y)
	o.collider.parent = o -- used so that colliders can find their parent object

	o.tag = "Spy" -- used for other objects to find out what kind of object this is

	o.GRAVITY_CONSTANT = 500 -- constant that determines fall speed
	o.JUMP_SPEED = 300
	o.RUN_SPEED = 200

	return o
end

function Spy:update(dt)
	self:collide()
	self:changeState(dt)
	self:runState(dt)

	self.collider:moveTo(self.position.x, self.position.y)
end

function Spy:collide()
	for other, delta in pairs(HC.collisions(self.collider)) do
		local otherParent = other.parent

		if (otherParent.tag == "Wall" or otherParent.tag == "VBoxOn") and (math.abs(delta.x) > 0 or math.abs(delta.y) > 0) then

			if math.abs(delta.x) > 0 then
				if self.position.x < otherParent.position.x then
					self.velocity.x = 0
					self.position.x = self.position.x - math.abs(delta.x)
				else
					self.velocity.x = 0
					self.position.x = self.position.x + math.abs(delta.x)
				end

			else
				if self.position.y < otherParent.position.y then
					if not self.hitGround then
						self.hitGround = true
						self.position.y = self.position.y - math.abs(delta.y)
					end
				else
					self.velocity.y = 0
					self.position.y = self.position.y + math.abs(delta.y)
				end
			end

		end
  end
end

function Spy:checkGround() -- returns true true if the spy is above a block; used to determine if the spy walked off a ledge
	for i, v in ipairs(wallList) do
		if v.collider:contains(self.position.x - self.size.x / 2, self.position.y + (self.size.y / 2) + 2) or v.collider:contains(self.position.x + self.size.x / 2, self.position.y + (self.size.y / 2) + 2) then
			return true
		end
	end
	for i, v in ipairs(vboxList) do
		if v.collider:contains(self.position.x - self.size.x / 2, self.position.y + (self.size.y / 2) + 2) or v.collider:contains(self.position.x + self.size.x / 2, self.position.y + (self.size.y / 2) + 2) then
			return true
		end
	end
	return false
end

function Spy:changeState(dt)
	if self.state == "run" then
		if self.controller.aEdge then
			self.state = "air"
			self.velocity = self.velocity + vector.new(0, -self.JUMP_SPEED)
		elseif not self:checkGround() then
			self.state = "air"
		end

	elseif self.state == "air" then
		if self.hitGround then
			self.hitGround = false
			self.state = "run"
			self.velocity.x, self.velocity.y = 0, 0
		end
	end
end

function Spy:runState(dt)
	if self.state == "run" then
		self:runRun(dt)
	elseif self.state == "air" then
		self:runAir(dt)
	end
end

function Spy:runRun(dt)
	self.velocity.x, self.velocity.y = 0, 0
	if self.controller.joy1.x > 0 then
		self.velocity = self.velocity + vector.new(self.RUN_SPEED, 0)
	elseif self.controller.joy1.x < 0 then
		self.velocity = self.velocity + vector.new(-self.RUN_SPEED, 0)
	end

	self.position = self.position + (self.velocity * dt)
end

function Spy:runAir(dt)
	local acceleration = vector.new(0, self.GRAVITY_CONSTANT)
	self.velocity = self.velocity + (acceleration * dt)

	if self.controller.joy1.x > 0 then
		self.velocity.x = self.RUN_SPEED
	elseif self.controller.joy1.x < 0 then
		self.velocity.x = -self.RUN_SPEED
	else
		self.velocity.x = 0
	end

	self.position = self.position + (self.velocity * dt)
end

function Spy:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y)
end
