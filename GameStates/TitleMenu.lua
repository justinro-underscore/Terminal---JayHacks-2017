TitleMenu = {}

function TitleMenu:new()
  local o = {}
  setmetatable(o, {__index = self})
  o.isComplete = false
  return o
end

function TitleMenu:loadState()

end

function TitleMenu:updateState(dt)
  gamepadList[1]:update(dt)
  if gamepadList[1].aEdge then
    o.isComplete = true
  end
end

function TitleMenu:drawState()
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("fill", 50, 50, 200, 35)
	love.graphics.setColor(60, 60, 60)
  love.graphics.print("THIS IS A TITLE MENU", 55, 55)
end
