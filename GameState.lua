GameState = {}

function GameState:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.splashScreen = SplashScreen:new()
  o.titleMenu = TitleMenu:new()
	o.level01 = Level01:new()
	o.currentState = o.level01
	o.currentState:loadState()
	o.stateName = "level01"

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

function GameState:keyInput(key)
  self.currentState:key(key)
end

function GameState:textInput(text)
  self.currentState:text(text)
end

function GameState:updateState(dt) -- calls the update method of whatever the current state is
  self.currentState:updateState(dt)
end

function GameState:draw() -- calls the draw method of whatever the current state is
  self.currentState:drawState()
end
