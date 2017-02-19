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
  o.spy = nil
  o.display = {}

  o.placeholder = "" -- This variable holds any information needed for a future command (Ex. password)

  return o
end

function HackerCommands:setSpy(spy)
  self.spy = spy
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

function HackerCommands:access(terminal)
  self.output = ""
  if terminal == "" then
    self.output = "Please input a terminal to access"
    table.insert(self.display, self.output)
    return false
  end
  for i, v in ipairs(terminalList) do
    if terminal == v.terminalName then
      self.output = "Terminal '" .. terminal .. "' found"
      if v.unlocked then
        self.output = self.output .. ". Accessing terminal..."
        table.insert(self.display, self.output)
        for ii, vv in ipairs(v:unlock()) do
          table.insert(self.display, "'" .. vv .. "'")
        end
        return false
      else
        self.output = self.output .. ". Please input password:"
        self.placeholder = terminal
        table.insert(self.display, self.output)
        return true
      end
    end
  end
  self.output = "ERROR: Terminal '" .. terminal .. "' does not exist"
  table.insert(self.display, self.output)
  return false
end

function HackerCommands:password(pass)
  self.output = ""
  for i, v in ipairs(terminalList) do
    if self.placeholder == v.terminalName and pass == v.terminalPassword then -- Placeholder will have name of the terminal
      self.output = "Password accepted. Accessing terminal..."
      table.insert(self.display, self.output)
      for ii, vv in ipairs(v:unlock()) do
        table.insert(self.display, vv)
      end
      return nil
    end
  end
  self.output = "Password incorrect"
  table.insert(self.display, self.output)
end
