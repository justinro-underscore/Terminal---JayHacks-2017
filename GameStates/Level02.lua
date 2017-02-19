Level02 = {}

function Level02:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.isComplete = false
  return o
end

function Level02:loadState()
	table.insert(spyList, Spy:new(50, -200, gamepadList[1])) -- new spy with the first gamepad
  table.insert(hackerList, Hacker:new())




	for i = 1, 300, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(i, 150))
	end
  for i=0,400,32 do
    table.insert(wallList, Wall:new(325,(150+i)))
  end
  for i=0, 70,32 do
    table.insert(trapList, Trap:new(355+i,590))
	end
  for i=0, 160,32 do
    table.insert(wallList, Wall:new(510+i,480))
  end
  for i=0, 640,32 do
    table.insert(wallList, Wall:new(720,490-i))
  end
  for i=0,600,32 do
    table.insert(wallList, Wall:new(500,300-i))
  end
  for i=0,1270,32 do
    table.insert(wallList, Wall:new(500+i,-410))
  end
  for i=0,700,32 do
    table.insert(wallList, Wall:new(715+i,-240))
  end
  for i=0,200,32 do
    table.insert(wallList, Wall:new(1500+i,-240))
  end
  for i=0,200,32 do
    table.insert(wallList, Wall:new(1730,-240-i))
  end
  for i=0,300,32 do
    table.insert(wallList, Wall:new(1300+i,300))
  end
  for i=0,200,32 do
    table.insert(wallList, Wall:new(1625,300+i))
  end
  for i=0, 700,32 do
    table.insert(trapList, Trap:new(1625+i,525))
	end
  for i=0,200,32 do
    table.insert(wallList, Wall:new(2350,525-i))
  end
  for i=0,400,32 do
    table.insert(wallList, Wall:new(2350+i,300))
  end
  table.insert(vboxList, VBox:new(1900, 320, true,"vbox_1"))
  table.insert(vboxList, VBox:new(2100, 320, false,"vbox_2"))
  table.insert(terminalList, Terminal:new(1500, 220, "terminal_1", true, ""))
  table.insert(terminalList, Terminal:new(1900, 240, "terminal_2", true, ""))


  terminalList[1]:addInfluence(vboxList[1])
  terminalList[2]:addInfluence(vboxList[2])

  table.insert(turretList, Turret:new(1700, -280, "left"))
  table.insert(winObjectList, WinObject:new(2490, 230))


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
    camera:adjust()
    camera:set()

    for _, v in ipairs(drawableLists) do
      for __, vv in ipairs(v) do
        if not vv.isKill then
          vv:draw()
        end
      end
    end

    camera:reset()
    hackerList[1]:draw()
end
function Level01:checkWin()
  if spyList[1]:winCheck() then
    self.isComplete = true
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

  for k in pairs(terminalList) do
    terminalList[k] = nil
  end

  for k in pairs(doorList) do
    doorList[k] = nil
  end
end
