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

  textList = {}
  coordList = {}

	table.insert(spyList, Spy:new(175, 100, gamepadList[1]))
  table.insert(hackerList, Hacker:new())

  for i=16, 208, 32 do
    table.insert(wallList, Wall:new(100, i))
    table.insert(wallList, Wall:new(292, i))
  end
  for i=208, 400, 32 do
    table.insert(wallList, Wall:new(100, i))
  end
  for i=100, 292, 32 do
    table.insert(wallList, Wall:new(i, 400))
  end
  for i=292, 2800, 32 do
    table.insert(wallList, Wall:new(i, 400))
    table.insert(wallList, Wall:new(i, 208))
  end
  table.insert(textList, "Hello there Agents X and Y (Clever names, I know.) I'm glad you came down here today.")
  table.insert(coordList, 400)
  table.insert(coordList, 250)
  table.insert(textList, "We've got a major assignment for you two, but you have to work together.")
  table.insert(coordList, 1200)
  table.insert(coordList, 270)
  table.insert(textList, "Now, I know it's been awhile since you two have been in the field together...")
  table.insert(coordList, 1910)
  table.insert(coordList, 260)
  table.insert(textList, "So we're going to run through some team building exercises (Stop your groaning.)")
  table.insert(coordList, 1900)
  table.insert(coordList, 280)

  for i=2788, 3204, 32 do
    table.insert(wallList, Wall:new(i, 112))
    table.insert(wallList, Wall:new(i, 400))
  end
  for i=112, 208, 32 do
    table.insert(wallList, Wall:new(2788, i))
    table.insert(wallList, Wall:new(3204, i))
  end
  table.insert(wallList, Wall:new(2980, 336))
  table.insert(wallList, Wall:new(2980, 368))
  table.insert(wallList, Wall:new(3012, 368))
  table.insert(textList, "X, you're going to be our man in the field,")
  table.insert(coordList, 2825)
  table.insert(coordList, 200)
  table.insert(textList, "just like last time.")
  table.insert(coordList, 2900)
  table.insert(coordList, 220)
  table.insert(textList, "Press A to jump over these boxes.")
  table.insert(coordList, 2850)
  table.insert(coordList, 260)

  for i=3204, 3800, 32 do
    table.insert(wallList, Wall:new(i, 208))
    table.insert(wallList, Wall:new(i, 400))
  end
  table.insert(textList, "Ah, a terminal and a door. Here's your chance to shine, Y.")
  table.insert(coordList, 3150)
  table.insert(coordList, 260)
  table.insert(textList, "X, simply walk up to that terminal. Y, when he gets there, type 'access'.")
  table.insert(coordList, 3100)
  table.insert(coordList, 280)
  table.insert(textList, "Now Y, just type 'toggle' and the name of the object you want to open.")
  table.insert(coordList, 3110)
  table.insert(coordList, 300)
  table.insert(terminalList, Terminal:new(3620,350,"terminal_1",true,""))
  table.insert(doorList, Door:new(3716, 336, "door_1"))
  terminalList[1]:addInfluence(doorList[1])
  terminalList[1]:addInfo("Good luck to everyone at JayHacks!")
  table.insert(wallList, Wall:new(3716, 270))
  table.insert(wallList, Wall:new(3716, 238))
  table.insert(textList, "Good work. Keep in mind that some terminals may have files on them,")
  table.insert(coordList, 4100)
  table.insert(coordList, 270)
  table.insert(textList, "So, it's a good idea to type 'access files' on any terminal you access")
  table.insert(coordList, 4090)
  table.insert(coordList, 290)


  for i=3780, 4708, 32 do
    table.insert(wallList, Wall:new(i, 208))
    table.insert(wallList, Wall:new(i, 400))
  end
  for i=4708, 4900, 32 do
    table.insert(wallList, Wall:new(i, 208))
    table.insert(wallList, Wall:new(i, 592))
  end
  for i=208, 400, 32 do
    table.insert(wallList, Wall:new(4900, i))
    table.insert(wallList, Wall:new(4708, (i + 192)))
  end

  for i=4900, 5508, 32 do
    table.insert(wallList, Wall:new(i, 400))
  end
  for i=4900, 5060, 32 do
    table.insert(wallList, Wall:new(i, 592))
  end
  for i=5060, 5188, 32 do
    table.insert(wallList, Wall:new(i, 656))
  end
  for i=592, 656, 32 do
    table.insert(wallList, Wall:new(5060, i))
    table.insert(wallList, Wall:new(5188, i))
  end
  table.insert(trapList, Trap:new(5092, 624))
  table.insert(trapList, Trap:new(5124, 624))
  table.insert(trapList, Trap:new(5156, 624))
  for i=5188, 5508, 32 do
    table.insert(wallList, Wall:new(i, 592))
  end
  table.insert(textList, "Look out! Honestly not sure how spikes got here,")
  table.insert(coordList, 4950)
  table.insert(coordList, 450)
  table.insert(textList, "But it would be best to avoid them as much as possible...")
  table.insert(coordList, 4925)
  table.insert(coordList, 470)

  for i=5508, 6020, 32 do
    table.insert(wallList, Wall:new(i, 400))
    table.insert(wallList, Wall:new(i, 592))
  end
  for i=6020, 6404, 32 do
    table.insert(wallList, Wall:new(i, 400))
    table.insert(wallList, Wall:new(i, 752))
  end
  for i=592, 752, 32 do
    table.insert(wallList, Wall:new(6020, i))
    table.insert(wallList, Wall:new(6404, i))
  end
  for i=6052, 6372, 32 do
    table.insert(trapList, Trap:new(i, 720))
  end
  table.insert(terminalList, Terminal:new(5988, 542, "terminal_2", false, "1234password"))
  table.insert(vboxList, VBox:new(6116, 624, false, "vbox_1"))
  table.insert(vboxList, VBox:new(6308, 624, false, "vbox_2"))
  terminalList[2]:addInfluence(vboxList[1])
  terminalList[2]:addInfluence(vboxList[2])
  terminalList[2]:addInfo("Ah, you're learning!")
  table.insert(textList, "Uh oh...")
  table.insert(coordList, 5550)
  table.insert(coordList, 480)
  table.insert(textList, "Don't worry! These here are VBoxes. You can toggle these on and off.")
  table.insert(coordList, 5800)
  table.insert(coordList, 470)
  table.insert(textList, "Some terminals, like this one, may require a password. Try '1234password'")
  table.insert(coordList, 5790)
  table.insert(coordList, 490)

  for i=6404, 7204, 32 do
    table.insert(wallList, Wall:new(i, 400))
    table.insert(wallList, Wall:new(i, 592))
  end
  table.insert(textList, "(Of course it was '1234password')")
  table.insert(coordList, 6650)
  table.insert(coordList, 460)
  for i=7204, 7396, 32 do
    table.insert(wallList, Wall:new(i, 400))
    table.insert(wallList, Wall:new(i, 592))
  end
  for i=7396, 7588, 32 do
    table.insert(wallList, Wall:new(i, 400))
    table.insert(wallList, Wall:new(i, 784))
  end
  for i=400, 592, 32 do
    table.insert(wallList, Wall:new(7588, i))
    table.insert(wallList, Wall:new(7396, (i + 192)))
  end
  table.insert(textList, "Look out! Somebody left a live turret down there.")
  table.insert(coordList, 7100)
  table.insert(coordList, 440)
  table.insert(textList, "Y, you can change the mode of X's armor by")
  table.insert(coordList, 7120)
  table.insert(coordList, 460)
  table.insert(textList, "typing 'mode', followed by the mode of armor you wish.")
  table.insert(coordList, 7100)
  table.insert(coordList, 480)
  table.insert(textList, "You can see your options by just typing 'mode'.")
  table.insert(coordList, 7120)
  table.insert(coordList, 500)
  table.insert(textList, "Here,we're going to need the 'defense' mode.")
  table.insert(coordList, 7130)
  table.insert(coordList, 520)

  for i=7588, 7780, 32 do
    table.insert(wallList, Wall:new(i, 592))
    table.insert(wallList, Wall:new(i, 784))
  end
  for i=7780, 7972, 32 do
    table.insert(wallList, Wall:new(i, 592))
    table.insert(wallList, Wall:new(i, 976))
  end
  for i=592, 784, 32 do
    table.insert(wallList, Wall:new(7972, i))
    table.insert(wallList, Wall:new(7780, (i + 192)))
  end
  table.insert(turretList, Turret:new(7716, 752, "left"))
  table.insert(textList, "In 'defense' mode, X can't take damage, but also can't jump.")
  table.insert(coordList, 7450)
  table.insert(coordList, 640)

  for i=7972, 8516, 32 do
    table.insert(wallList, Wall:new(i, 784))
    table.insert(wallList, Wall:new(i, 976))
  end
  for i=8516, 8676, 32 do
    table.insert(wallList, Wall:new(i, 976))
    table.insert(wallList, Wall:new(i, 592))
  end
  for i=784, 592, -32 do
    table.insert(wallList, Wall:new(8516, i))
    table.insert(wallList, Wall:new(8676, (i + 192)))
  end
  for i=8676, 9316, 32 do
    table.insert(wallList, Wall:new(i, 784))
    table.insert(wallList, Wall:new(i, 592))
  end
  for i=592, 784, 32 do
    table.insert(wallList, Wall:new(9316, i))
  end
  table.insert(textList, "One more thing! X, in acrobatic mode, you can wall jump.")
  table.insert(coordList, 8000)
  table.insert(coordList, 840)
  table.insert(textList, "Simply run next to a wall and press A.")
  table.insert(coordList, 8050)
  table.insert(coordList, 860)

  table.insert(textList, "Agents X and Y, I wish you the best of luck on your mission.")
  table.insert(coordList, 8700)
  table.insert(coordList, 630)
  table.insert(textList, "Step up to the elevator and press B. Good luck, and Godspeed.")
  table.insert(coordList, 8699)
  table.insert(coordList, 650)

  table.insert(winObjectList, WinObject:new(9252, 716))
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

  local numLength = table.getn(textList)
  for i=1, numLength do
      love.graphics.print(textList[i], coordList[1 + ((i-1) * 2)], coordList[2 + ((i-1) * 2)])
  end

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
    HC.remove(wallList[k].collider)
    wallList[k] = nil
  end

  for k in pairs(spyList) do
    HC.remove(spyList[k].collider)
    spyList[k] = nil
  end

  for k in pairs(hackerList) do
    hackerList[k] = nil
  end

  for k in pairs(vboxList) do
    HC.remove(vboxList[k].collider)
    vboxList[k] = nil
  end

  for k in pairs(trapList) do
    HC.remove(trapList[k].collider)
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
    HC.remove(doorList[k].collider)
    doorList[k] = nil
  end
end
