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

function GameState:changeState(state) -- Handle state changes
	if self.stateName == "splashScreen" then
		if gameTime >= 2 then -- switch off the splash screen after 2 seconds
			self.stateName = "titleMenu"
			self.currentState = self.titleMenu
			self.currentState:loadState()
		end
	
	elseif self.stateName == "titleMenu" then
		
	end
end

function GameState:updateState(dt) -- calls the update method of whatever the current state is
  self.currentState:updateState(dt)
end

function GameState:draw() -- calls the draw method of whatever the current state is
  self.currentState:drawState()
end
