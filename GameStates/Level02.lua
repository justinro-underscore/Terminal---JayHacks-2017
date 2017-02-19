Level02 = {}

function Level02:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function Level02:loadState()
	table.insert(spyList, Spy:new(50, -700, gamepadList[1])) -- new spy with the first gamepad
  table.insert(hackerList, Hacker:new())




	for i = 1, 300, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(i, 150))
	end
  for i=0,200,32 do
    table.insert(wallList, Wall:new(325,(150+i)))
  end
  for i=0, 70,32 do
    table.insert(trapList, Trap:new(355+i,345))
	end
  for i=0, 220,32 do
    table.insert(wallList, Wall:new(450+i,340))
  end
  for i=0, 250,32 do
    table.insert(wallList, Wall:new(680,345-i))
  end
  for i=0,200,32 do
    table.insert(wallList, Wall:new(500,200-i))
  end
  for i=0,600,32 do
    table.insert(wallList, Wall:new(700+i,85))
  end
end

function Level02:keyInput(key)
  hackerList[1]:keyInput(key)
end

function Level02:input(text)
  hackerList[1]:input(text)
end

function Level02:updateState(dt)
	for _, v in ipairs(updateableLists) do
    for __, vv in ipairs(v) do
      if not vv.isKill then
        vv:update(dt)
      end
    end
  end

  if spyList[1].isKill then
    self:clearState()
    self:loadState()
  end
end

function Level02:drawState()
  for _, v in ipairs(drawableLists) do
    for __, vv in ipairs(v) do
      if not vv.isKill then
        vv:draw()
      end
    end
  end
end

function Level02:clearState()
  for k in pairs(wallList) do
    wallList[k] = nil
  end

  for k in pairs(spyList) do
    spyList[k] = nil
  end

  for k in pairs(hackerList) do
    hackerList[k] = nil
  end

  for k in pairs(vboxList) do
    vboxList[k] = nil
  end

  for k in pairs(trapList) do
    trapList[k] = nil
  end

  for k in pairs(turretList) do
    turretList[k] = nil
  end

  for k in pairs(bulletList) do
    bulletList[k] = nil
  end
end
