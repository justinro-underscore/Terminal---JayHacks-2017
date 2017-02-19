WinObject = {}

function WinObject:new(x,y)
  o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x,y)
  o.size = vector.new(64,96)
  o.sprite = love.graphics.newImage("Spy Game Sprites/Elevator.png")

  return o
end

function WinObject:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(self.sprite , self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, 0, 2, 2) -- Places the sprite.
end
