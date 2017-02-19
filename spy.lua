Spy = {}

function Spy:new(x, y, controller)
	local o = {}
	setmetatable(o, {__index = self})

	o.position = vector.new(x, y)
	o.size = vector.new(64, 96)
	o.velocity = vector.new(0, 0)
	o.facing = "right" -- The way that the spy is facing

	o.controller = controller

	--[[
	possible state values:
	-ground
	-air
	]]
	o.state = "air"

	o.hitGround = false -- will be set to true by the collision function, used by changestate

	o.collider = HC.rectangle(x, y, o.size.x, o.size.y)
	o.collider.parent = o -- used so that colliders can find their parent object

	o.tag = "Spy" -- used for other objects to find out what kind of object this is

	o.GRAVITY_CONSTANT = 500 -- constant that determines fall speed
	o.JUMP_SPEED = 300
	o.RUN_SPEED = 200

	o.spriteFrames = {love.graphics.newImage("Spy Game Sprites/Standing.png"),
										love.graphics.newImage("Spy Game Sprites/Running Straight Left.png"),
										love.graphics.newImage("Spy Game Sprites/Mid-Running Right.png"),
										love.graphics.newImage("Spy Game Sprites/Running Right.png"),
										love.graphics.newImage("Spy Game Sprites/Running Straight Right.png"),
										love.graphics.newImage("Spy Game Sprites/Mid-Running Left.png"),
										love.graphics.newImage("Spy Game Sprites/Running Left.png"),
										love.graphics.newImage("Spy Game Sprites/Jumping.png")}
	o.spriteFra = 2
	o.sprite = o.spriteFrames[1]
	o.time = 0

	return o
end

function Spy:update(dt)
	self:collide()
	self:changeState(dt)
	self:runState(dt)
	self:face()
	self:updateSprite(dt)

	self.collider:moveTo(self.position.x, self.position.y)
end

function Spy:updateSprite(dt)
	self.time = self.time + dt
	if self.state == "air" then
		self.sprite = self.spriteFrames[8]
		self.spriteFra = 2
		self.time = 0
	elseif self.velocity.x == 0 then
		self.sprite = self.spriteFrames[1]
		self.spriteFra = 2
		self.time = 0
	elseif self.state == "air" then
		self.sprite = self.spriteFrames[8]
		self.spriteFra = 2
		self.time = 0
	else
		self.sprite = self.spriteFrames[self.spriteFra]
		if self.time >= (40 / self.RUN_SPEED) then
			self.spriteFra = self.spriteFra + 1
			self.time = self.time - (40 / self.RUN_SPEED)
		end
		if self.spriteFra > 7 then
			self.spriteFra = 2
		end
	end
end

function Spy:collide()
	for other, delta in pairs(HC.collisions(self.collider)) do
		local otherParent = other.parent

		if otherParent.tag == "Wall" and (math.abs(delta.x) > 0 or math.abs(delta.y) > 0) then

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


function Spy:changeState(dt)
	if self.state == "run" then
		if self.controller.aEdge then
			self.state = "air"
			self.velocity = self.velocity + vector.new(0, -self.JUMP_SPEED)
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

function Spy:face() -- Determines which way spy is facing
	if self.velocity.x > 0 then
		self.facing = "right"
	elseif self.velocity.x < 0 then
		self.facing = "left"
	end
end

function Spy:draw()
	love.graphics.setColor(255, 255, 255)

	local x = (self.position.x - self.size.x / 2) -- x coord
	local y = (self.position.y - self.size.y / 2) -- y coord

	if self.facing == "right" then
  	love.graphics.draw(self.sprite, x, y, 0, 2, 2) -- Places the sprite.
	elseif self.facing == "left" then
		x = x + self.size.x
	  love.graphics.draw(self.sprite, x, y, 0, -2, 2) -- Places the sprite.
	end
end
