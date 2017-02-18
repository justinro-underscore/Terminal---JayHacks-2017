HackerCommands = {}

function HackerCommands:new(spy)
  local o = {}
  setmetatable(o, {__index = self})

  o.output = ""
  o.spy = nil
  o.display ={}

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
  --for i,
end
