Level01 = {}

function Level01:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function Level01:loadState()
	table.insert(spyList, Spy:new(200, 50, gamepadList[1])) -- new spy with the first gamepad
  table.insert(hackerList, Hacker:new())
  table.insert(terminalList, Terminal:new(300, 202, "terminal_1", false, "poop"))
  terminalList[1]:addInfo("Did you know that Alex is a poser?")
  table.insert(terminalList, Terminal:new(450, 202, "terminal_2", true, ""))
  terminalList[2]:addInfo("Congrats, you unlocked an unlocked terminal. Woopdeedoo")
  table.insert(doorList, Door:new(500, 202))

  table.insert(vboxList, VBox:new(600, 200, true))
  table.insert(vboxList, VBox:new(700, 200, false))
	for i = 100, 500, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(i, 500))
	end
  for i = 100, 550, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(400, i))
	end
  for i = 100, 550, 32 do -- make a bunch of walls at 32 px appart
		table.insert(wallList, Wall:new(100, i))
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
