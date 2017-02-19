TitleMenu = {}

function TitleMenu:new()
  local o = {}
  setmetatable(o, {__index = self})
  o.image = love.graphics.newImage("Spy Game Sprites/Title Screen.png")
  o.fade = 255
  o.fadedIn = false
  o.ready = false
  o.start = false
  o.volume = 1
  o.isComplete = false
  return o
end

function TitleMenu:loadState()

end

function TitleMenu:updateState(dt)
  gamepadList[1]:update(dt)
  if self.ready and gamepadList[1].aEdge then
    self.start = true
  end
end

function SplashScreen:input(text)

end

function SplashScreen:keyInput(key)

end

function TitleMenu:drawState()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(self.image, 0, 0)

  love.graphics.setColor(0, 0, 0, self.fade)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
  if not self.fadedIn and self.fade > 0 then
    self.fade = self.fade - 2
  elseif not self.fadedIn and self.fade < 0 then
    self.fade = 0
    self.fadedIn = true
    self.ready = true
  end
  if self.start and self.fade < 255 then
    self.fade = self.fade + 2
    love.audio.setVolume(self.volume)
    self.volume = self.volume - 0.01
  elseif self.start and self.fade > 255 then
    self.fade = 255
    love.audio.stop()
    self.isComplete = true
  end
end
