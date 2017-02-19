FinalLevel = {}

function FinalLevel:new()
  local o = {}
  setmetatable(o, {__index = self})
  o.image = love.graphics.newImage("Spy Game Sprites/End Screen.png")
  o.isComplete = false
  o.fade = 255
  o.fadedIn = false
  return o
end

function FinalLevel:loadState()
  love.audio.stop()
  love.audio.play(menuSong)
end

function FinalLevel:updateState(dt)
  gamepadList[1]:update(dt)
  if self.fade == 0 and gamepadList[1].aEdge then
    self.fadedIn = true
  end
end

function FinalLevel:input(text)
  if self.fade == 0 and text then
    self.fadedIn = true
  end
end

function FinalLevel:keyInput(key)
  if self.fade == 0 and key then
    self.fadedIn = true
  end
end

function FinalLevel:drawState()
  love.graphics.setColor(255,255,255)
	love.graphics.draw(self.image, 0, 0)

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
    love.event.quit()
  end
end
