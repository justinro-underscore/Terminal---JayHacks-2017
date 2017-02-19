--[[
Hacker commands:

- change (mode)
  - OR mode (mode)
 Changes the current mode spy is in

-
]]

HackerCommands = {}

function HackerCommands:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.output = ""
  o.display = {}
  o.currentTerminal = nil

  o.placeholder = "" -- This variable holds any information needed for a future command (Ex. password)

  return o
end

function HackerCommands:setDisplay(display)
  self.display = display
end

function HackerCommands:changeMode(mode)
  self.output = ""
  if mode == "" then
    self.output = "Modes available: {'acrobatic','defense'}"
  elseif mode == "acrobatic" then
    if spyList[1].mode == "acrobatic" then
      self.output = "Mode already set to 'acrobatic'"
    else
      self.output = "Mode changed to 'acrobatic'"
      spyList[1]:setMode(mode)
    end
  elseif mode == "defense" then
    if spyList[1].mode == "defense" then
      self.output = "Mode already set to 'defense'"
    else
      self.output = "Mode changed to 'defense'"
      spyList[1]:setMode(mode)
    end
  else
    self.output = "ERROR: Mode '" .. mode .. "' not recognized"
  end
  table.insert(self.display, self.output)
end

function HackerCommands:access(object)
  self.output = ""
  if object == "files" or object == "file" then
    if self.currentTerminal then
      table.insert(self.display, "Accessing terminal '" .. self.currentTerminal.terminalName .. "' files...")
      for i, v in ipairs(self.currentTerminal:unlock()) do
        table.insert(self.display, "'" .. v .. "'")
      end
    else
      self.output = "ERROR: Not connected to a terminal"
      table.insert(self.display, self.output)
    end
    return false
  end
  local terminal = spyList[1].terminalTouch
  if terminal and terminal == self.currentTerminal then
    table.insert(self.display, "Already connected to '" .. self.currentTerminal.terminalName .. "'")
    return false
  end
  if terminal then
    self.output = "Terminal '" .. terminal.terminalName .. "' found"
    if terminal.unlocked then
      self.output = self.output .. ". Accessing terminal..."
      table.insert(self.display, self.output)
      hackerList[1]:setCurrentTerminal(terminal)
      return false
    else
      self.output = self.output .. ". Please input password:"
      self.placeholder = terminal
      table.insert(self.display, self.output)
      return true
    end
  end
  self.output = "ERROR: No terminal detected"
  table.insert(self.display, self.output)
  return false
end

function HackerCommands:password(pass)
  self.output = ""
  if self.placeholder.terminalPassword == pass then -- Placeholder will have name of the terminal
    self.output = "Password accepted. Accessing terminal..."
    table.insert(self.display, self.output)
    self.placeholder:unlock()
    hackerList[1]:setCurrentTerminal(self.placeholder)
  else
    self.output = "Password incorrect"
    table.insert(self.display, self.output)
  end
end

function HackerCommands:toggle(object)
  self.output = ""
  if object == "" then
    self.output = "Objects available: {"
    local numLength = (table.getn(self.currentTerminal.influence))
    if numLength == 0 then
      self.output = self.output .. "}"
      table.insert(self.display, self.output)
      return nil
    end
    for i = 1, (numLength - 1) do
      self.output = self.output .. "'" .. self.currentTerminal.influence[i].name .. "', "
    end
    self.output = self.output .. "'" .. self.currentTerminal.influence[numLength].name .. "'}"
    table.insert(self.display, self.output)
  else
    for i, v in ipairs(self.currentTerminal.influence) do
      if object == v.name then
        self.output = "Successfully toggled '" .. v.name .. "'"
        table.insert(self.display, self.output)
        local result = v:toggle()
        table.insert(self.display, result)
        return nil
      end
    end
    self.output = "Could not find object with name of '" .. object .. "'"
    table.insert(self.display, self.output)
  end
end
