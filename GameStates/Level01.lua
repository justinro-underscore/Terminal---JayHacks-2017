Level01 = {}

function Level01:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function Level01:loadState()
	table.insert(spyList, Spy:new(200, 50, gamepadList[1])) -- new spy with the first gamepad
  table.insert(hackerList, Hacker:new())

	for i = 100, 500, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(i, 250))
	end
end

function Level01:keyInput(key)
  hackerList[1]:keyInput(key)
end

function Level01:input(text)
  hackerList[1]:input(text)
end

function Level01:updateState(dt)
	for _, v in ipairs(updateableLists) do
    for __, vv in ipairs(v) do
      vv:update(dt)
    end
  end
end

function Level01:drawState()
  for _, v in ipairs(drawableLists) do
    for __, vv in ipairs(v) do
      vv:draw(dt)
    end
  end
end
