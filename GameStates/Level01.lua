Level01 = {}

function Level01:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function Level01:loadState()
	local joysticks = love.joystick.getJoysticks()
	self.control = Gamepad:new(joysticks[1])

	self.player = Spy:new(200, 200, self.control)
	self.wallList = {}
	for i = 100, 500, 32 do
		table.insert(self.wallList, Wall:new(i, 500))
	end
end

function Level01:updateState(dt)
	self.control:update(dt)
	self.player:update(dt)
end

function Level01:drawState()
	self.player:draw()
  for i, v in ipairs(self.wallList) do
		v:draw()
	end
end