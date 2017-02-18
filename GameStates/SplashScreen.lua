SplashScreen = {}

function SplashScreen:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function SplashScreen:loadState()

end

function SplashScreen:updateState(dt)

end

function SplashScreen:drawState()
	love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 50, 50, 200, 35)
	love.graphics.setColor(60, 60, 60)
  love.graphics.print("THIS IS A SPLASH SCREEN", 55, 55)
end
