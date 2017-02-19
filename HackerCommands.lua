--[[
Hacker commands:

- change (mode)
  - OR mode (mode)
 Changes the current mode spy is in

-
]]

HackerCommands = {}

function HackerCommands:new(spy)
  local o = {}
  setmetatable(o, {__index = self})

  o.output = ""
  o.display = {}

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
    self.output = "Mode changed to 'acrobatic'"
  elseif mode == "defense" then
    self.output = "Mode changed to 'defense'"
  else
    self.output = "ERROR: Mode '" .. mode .. "' not recognized"
  end
  table.insert(self.display, self.output)
end

function HackerCommands:access(object)
  self.output = ""
  local terminal = spyList[1].terminalTouch
  if terminal == hackerList[1].currentTerminal then
    table.insert(self.display, "Already connected to '" .. hackerList[1].currentTerminal.terminalName .. "'")
    return false
  end
  if object == "files" or object == "file" then
    if hackerList[1].currentTerminal then
      table.insert(self.display, "Accessing terminal '" .. hackerList[1].currentTerminal.terminalName .. "' files...")
      for i, v in ipairs(hackerList[1].currentTerminal:unlock()) do
        table.insert(self.display, "'" .. v .. "'")
      end
    else
      self.output = "ERROR: Not connected to a terminal"
      table.insert(self.display, self.output)
    end
    return false
  end
  if terminal then
    self.output = "Terminal '" .. terminal.terminalName .. "' found"
    if terminal.unlocked then
      self.output = self.output .. ". Accessing terminal..."
      table.insert(self.display, self.output)
      hackerList[1].currentTerminal = terminal
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
    hackerList[1].currentTerminal = self.placeholder
  else
    self.output = "Password incorrect"
    table.insert(self.display, self.output)
  end
end
