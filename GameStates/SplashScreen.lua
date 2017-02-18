SplashScreen = {}

function SplashScreen:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function SplashScreen:updateState()

end

function SplashScreen:drawState()
  love.graphics.rectangle("fill", 50, 50, 200, 35)
  love.graphics.print("THIS IS A SPLASH SCREEN", 55, 55)
end
