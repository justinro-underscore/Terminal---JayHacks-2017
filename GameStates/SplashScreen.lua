SplashScreen = {}

function SplashScreen:new()
  local o = {}
  setmetatable(o, {__index = self})
  o.isComplete = false
  o.fade = 255
  o.fadedIn = false
  return o
end

function SplashScreen:loadState()
  love.audio.play(menuSong)
end

function SplashScreen:updateState(dt)
  gamepadList[1]:update(dt)
  if self.fade == 0 and gamepadList[1].aEdge then
    self.fadedIn = true
  end
end

function SplashScreen:input(text)
  if self.fade == 0 and text then
    self.fadedIn = true
  end
end

function SplashScreen:keyInput(key)
  if self.fade == 0 and key then
    self.fadedIn = true
  end
end

function SplashScreen:drawState()
	love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 50, 50, 200, 35)
	love.graphics.setColor(60, 60, 60)
  love.graphics.print("THIS IS A SPLASH SCREEN", 100, 100)

  love.graphics.setColor(0, 0, 0, self.fade)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
  if not self.fadedIn and self.fade > 0 then
    self.fade = self.fade - 2
  elseif not self.fadedIn and self.fade < 0 then
    self.fade = 0
  elseif self.fadedIn and self.fade < 255 then
    self.fade = self.fade + 2
  elseif self.fadedIn and self.fade > 255 then
    self.fade = 255
    self.isComplete = true
  end
end
