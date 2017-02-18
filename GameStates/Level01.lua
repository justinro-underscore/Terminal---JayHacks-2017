Level01 = {}

function Level01:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function Level01:loadState()
	table.insert(spyList, Spy:new(200, 200, gamepadList[1])) -- new spy with the first gamepad

	for i = 100, 500, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(i, 500))
	end

  self.hacker = Hacker:new()
  self.hacker:setSpy(self.player)
end

function Level01:updateState(dt)
	self.control:update(dt)
	self.player:update(dt)
  self.hacker:update(dt)
end

function Level01:key(key)
  self.hacker:keyInput(key)
end

function Level01:text(text)
  self.hacker:input(text)
end

function Level01:drawState()
	--[[self.player:draw()
  for i, v in ipairs(self.wallList) do
		v:draw()
	end]]
  self.hacker:draw()
  
	for _, v in ipairs(updateableLists) do
    for __, vv in ipairs(v) do
      vv:update(dt)
    end
  end
  
  for _, v in ipairs(drawableLists) do
    for __, vv in ipairs(v) do
      vv:draw(dt)
    end
  end
end
