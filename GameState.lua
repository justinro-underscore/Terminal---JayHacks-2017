GameState = {}

function GameState:new()
  local o = {}
  setmetatable(o, {__index = self})

  o.splashScreen = SplashScreen:new()
  o.titleMenu = TitleMenu:new()
	o.level01 = Level01:new()
  o.level02 = Level02:new()
	o.currentState = o.level01
	o.currentState:loadState()

  return o
end

function GameState:changeState(state) -- Handle state changes
	if self.currentState == self.splashScreen then
		if self.currentState.isComplete then
			self.currentState = self.titleMenu
			self.currentState:loadState()
		end

	elseif self.currentState == self.titleMenu then
    if self.currentState.isComplete then
      self.currentState = self.level01
      self.currentState:loadState()
    end

  elseif self.currentState == self.level01 then
    if self.currentState.isComplete then
      self.currentState:clearState()
      self.currentState = self.level02
      self.currentState:loadState()
    end
	end
end

function GameState:keyInput(key)
  self.currentState:keyInput(key)
end

function GameState:input(text)
  self.currentState:input(text)
end

function GameState:updateState(dt) -- calls the update method of whatever the current state is
  self.currentState:updateState(dt)
end

function GameState:draw() -- calls the draw method of whatever the current state is
  self.currentState:drawState()
end
