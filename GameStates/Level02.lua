Level02 = {}

function Level02:new()
  local o = {}
  setmetatable(o, {__index = self})
  o.isComplete = true
  return o
end

function Level02:loadState()
  table.insert(spyList, Spy:new(200, 50, gamepadList[1])) -- new spy with the first gamepad
  table.insert(hackerList, Hacker:new())

  table.insert(winObjectList, WinObject:new(250, 230))
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
