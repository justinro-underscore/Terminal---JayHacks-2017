Level01 = {}

function Level01:new()
  local o = {}
  setmetatable(o, {__index = self})
  o.time = 0
  o.endOfLevel = false
  o.isComplete = false
  return o
end

function Level01:loadState()
  love.audio.setVolume(1)
  love.audio.play(gameSong)

	table.insert(spyList, Spy:new(200, 150, gamepadList[1])) -- new spy with the first gamepad
  table.insert(hackerList, Hacker:new())

  table.insert(vboxList, VBox:new(600, 200, true,"vbox_1"))
  table.insert(vboxList, VBox:new(700, 200, false,"vbox_2"))

  table.insert(terminalList, Terminal:new(350, 252, "terminal_1", false, "poop"))
  terminalList[1]:addInfo("Did you know that Alex is a poser?")
  table.insert(terminalList, Terminal:new(150, 252, "terminal_2", true, ""))
  terminalList[2]:addInfo("Congrats, you unlocked an unlocked terminal. Woopdeedoo")
  terminalList[2]:addInfluence(vboxList[1])
  terminalList[2]:addInfluence(vboxList[2])
  table.insert(doorList, Door:new(300, 202,"door_1"))
  terminalList[2]:addInfluence(doorList[1])

  table.insert(winObjectList, WinObject:new(250, 230))
  table.insert(turretList, Turret:new(200, 100, "left"))
  table.insert(turretList, Turret:new(150, 50, "right"))

	for i = 100, 500, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(i, 300))
	end
  for i = 100, 550, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(400, i))
	end
  for i = 100, 550, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(100, i))
	end

end

function Level01:checkWin(dt)
  if spyList[1]:winCheck() or self.endOfLevel then
    if self.time == 0 then
      love.audio.stop()
      love.audio.play(winSound)
      self.endOfLevel = true
    end

    self.time = self.time + dt
    if self.time > 7 then
      self.isComplete = true
    end
  end
end

function Level01:keyInput(key)
  hackerList[1]:keyInput(key)
end

function Level01:input(text)
  hackerList[1]:input(text)
end

function Level01:updateState(dt)
  self:checkWin(dt)
	for _, v in ipairs(updateableLists) do
    for __, vv in ipairs(v) do
      if not vv.isKill then
        vv:update(dt)
      end
    end
  end

  if spyList[1].isKill then
    if self.time == 0 then
      love.audio.stop()
      love.audio.play(deathSound)
    end

    self.time = self.time + dt
    if self.time > 3 then
      self:clearState()
      self:loadState()
      self.time = 0
    end
  end
end

function Level01:drawState()
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

function Level01:clearState()
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
