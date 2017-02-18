Spy = {}

function Spy:new(x, y)
	o = {}
	setmetatable(o, {__index = self})

	o.position = vector.new(x, y)
	o.size = vector.new(32, 48)
	o.velocity = vector.new(0, 0)

	--[[
	possible state values:
	-ground
	-air
	]]
	o.state = "air"
	o.collider = HC.rectangle(x, y, o.size.x, o.size.y)

	o.GRAVITY_CONSTANT = 500 -- constant that determines fall speed

	return o
end

function Spy:update(dt)
	self:changeState(dt)
	self:runState(dt)
end

function Spy:changeState(dt)

end

function Spy:runState(dt)
	self:runAir(dt)
end

function Spy:runAir(dt)
	local acceleration = vector.new(0, self.GRAVITY_CONSTANT)
	self.velocity = self.velocity + (acceleration * dt)
	self.position = self.position + (self.velocity * dt)
end

function Spy:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y)
end
