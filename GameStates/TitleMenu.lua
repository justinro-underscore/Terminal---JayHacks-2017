TitleMenu = {}

function TitleMenu:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function TitleMenu:updateState()

end

function TitleMenu:drawState()
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("fill", 50, 50, 200, 35)
  love.graphics.print("THIS IS A SPLASH SCREEN", 55, 55)
end
