GameState = {}

function GameState:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.splashScreen = SplashScreen:new()
  o.titleMenu = TitleMenu:new()
	o.currentState = o.splashScreen
	o.stateName = "splashScreen"

  return o
end

function GameState:changeState(state)
	if self.stateName == "splashScreen" then
		if gameTime >= 2 then
			self.stateName = "titleMenu"
			self.currentState = self.titleMenu
			self.currentState:loadState()
		end
	
	elseif self.stateName == "titleMenu" then
		
	end
end

function GameState:updateState(dt)
  self.currentState:updateState(dt)
end

function GameState:draw()
  self.currentState:drawState()
end
