Hacker = {}

-- Creates the new object
function Hacker:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.currentInput = "" -- What is currently being typed
  o.blink = "_" -- Blinks the blinky thingy at the end of the input
  o.time = 0 -- Time spent between blinks
  o.submitInput = "" -- Used to analyze what command to run
  o.characterCount = 0 -- Limits the number of characters typed to 61
  o.inputted = {} -- List of already inputted texts

  return o
end

-- Blinky thingy
function Hacker:update(dt)
  self.time = self.time + dt
  if self.time <= 0.5 then -- Blinks on for half a second...
    self.blink = "_"
  elseif self.time <= 1 then -- Blinks off for half a second
    self.blink = ""
  else
    self.time = 0; -- Reset time
  end
end

-- Get the input
function Hacker:input(text)
  if self.characterCount <= 61 then -- 61 character limit
    self.currentInput = self.currentInput .. text
    self.characterCount = self.characterCount + 1
  end
end

-- Special cases
function Hacker:keyInput(key)
  if key == "backspace" then -- Delete stuff
    self.currentInput = string.sub(self.currentInput, 0, string.len(self.currentInput) - 1)
    self.characterCount = self.characterCount - 1
  elseif key == "return" then -- Runs the command inputted
    self.submitInput = self.currentInput -- Puts in past input
    table.insert(self.inputted, self.currentInput) -- Adds the last thing written to the list
    self:runCommand() -- Runs the command written
    self.currentInput = "" -- Resets the command prompt
    self.characterCount = 0 -- Resets the character count
  end
end

-- Will run commands using the submitInput variable once we have commands to run
function Hacker:runCommand()

end

-- Draw the stuff
function Hacker:draw()
  love.graphics.setColor(254, 215, 0)
  love.graphics.setNewFont("cour.ttf", 20) -- Sets font to Courier New
  love.graphics.print("> " .. self.currentInput .. self.blink, 10, love.graphics.getHeight()-30) -- Prints the command line

  local yVal = love.graphics.getHeight() - 60 -- Spaces inbetween previous inputs
  local numLength = (table.getn(self.inputted)) -- Length of previous input list
  for i = numLength, 1, -1 do -- Goes through the list backwards
    love.graphics.print("> " .. self.inputted[i], 10, yVal)
    yVal = yVal - 30
  end
end