TitleMenu = {}

function TitleMenu:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function TitleMenu:loadState()
	self.player = Spy:new(200, 200)
end

function TitleMenu:updateState(dt)
	self.player:update(dt)
end

function TitleMenu:drawState()
	self.player:draw()
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("fill", 50, 50, 200, 35)
	love.graphics.setColor(60, 60, 60)
  love.graphics.print("THIS IS A SPLASH SCREEN", 55, 55)
end
