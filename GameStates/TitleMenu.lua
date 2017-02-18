TitleMenu = {}

function TitleMenu:new()
  local o = {}
  setmetatable(o, {__index = self})
  return o
end

function TitleMenu:loadState()
	self.player = Spy:new(200, 200)
  self.droneList = {}
  self.droneList[1] = BattleDrone:new(300, 200, 400, 150)
  self.droneList[2] = BattleDrone:new(450, 200, 550, 100)
end

function TitleMenu:updateState(dt)
	self.player:update(dt)
  for i, v in ipairs(self.droneList) do
    v:update(dt)
  end
end

function TitleMenu:drawState()
	self.player:draw()
  for i, v in ipairs(self.droneList) do
    v:draw()
  end
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("fill", 50, 50, 200, 35)
	love.graphics.setColor(60, 60, 60)
  love.graphics.print("THIS IS A TITLE MENU", 55, 55)
end
