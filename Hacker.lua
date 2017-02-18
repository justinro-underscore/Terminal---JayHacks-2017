Hacker = {}

function Hacker:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.currentInput = ""
  o.blink = "_"
  o.time = 0
  o.submitInput = ""
  o.characterCount = 0
  o.inputted = {}

  return o
end

function Hacker:update(dt)
  self.time = self.time + dt
  if self.time <= 0.5 then
    self.blink = "_"
  elseif self.time <= 1 then
    self.blink = ""
  else
    self.time = 0;
  end
end

function Hacker:input(text)
  --61 Character limit
  if self.characterCount <= 61 then
    self.currentInput = self.currentInput .. text
    self.characterCount = self.characterCount + 1
  end
end

function Hacker:keyInput(key)
  if key == "backspace" then
    self.currentInput = string.sub(self.currentInput, 0, string.len(self.currentInput) - 1)
    self.characterCount = self.characterCount - 1
  elseif key == "return" then
    self.submitInput = self.currentInput
    table.insert(self.inputted, self.currentInput)
    self:runCommand()
    self.currentInput = ""
    self.characterCount = 0
  end
end

function Hacker:runCommand()

end

function Hacker:draw()
  love.graphics.setColor(254, 215, 0)
  love.graphics.setNewFont("cour.ttf", 20)
  love.graphics.print("> " .. self.currentInput .. self.blink, 10, love.graphics.getHeight()-30)

  local yVal = love.graphics.getHeight() - 60
  local numLength = (table.getn(self.inputted))
  love.graphics.print(numLength)
  for i = numLength, 1, -1 do
    love.graphics.print("> " .. self.inputted[i], 10, yVal)
    yVal = yVal - 30
  end
end
