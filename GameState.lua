GameState = {}

function GameState:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.currentState = nil
  o.splash = SplashScreen:new()
  o.title = TitleMenu:new()
  o.test = 122431414

  return o
end

function GameState:changeState(state)
  if state == "splash" then
    self.currentState = self.splash
  elseif state == "titleScreen" then
    self.currentState = self.title
  end
end

function GameState:update()
  self.currentState:updateState()
end

function GameState:draw()
  self.currentState:drawState()
end
