BattleDrone = {}

function BattleDrone:new(x,y,x2,y2)
  local o = {}
  setmetatable(o, {__index = self})

  o.initialPostion = vector.new(x,y)
  o.finalPosition = vector.new(x2,y2)
	o.position = vector.new(x,y)
  o.velocity = vector.new(70, 70)
	o.size = vector.new(16, 16)
  o.facing = "right" -- Marks which way the drone is moving

  return o
end

function BattleDrone:update(dt)


  -- Handles the movement
  if self.position.x < self.finalPosition.x and self.facing == "right" then
    if self.position.x + (self.velocity.x * dt) > self.finalPosition.x then -- If the movement will go over the final pos, then jump to final pos
      self.position.x = self.finalPosition.x
    else
      self.position.x = self.position.x + (self.velocity.x * dt)
    end
  elseif self.position.x >= self.finalPosition.x and self.facing == "right" then
    self.facing = "up"
  elseif self.position.y > self.finalPosition.y and self.facing == "up" then
    if self.position.y - (self.velocity.y * dt) < self.finalPosition.y then
      self.position.y = self.finalPosition.y
    else
      self.position.y = self.position.y - (self.velocity.y * dt)
    end
  elseif self.position.y <= self.finalPosition.y and self.facing == "up" then
    self.facing = "left"
  elseif self.position.x > self.initialPostion.x and self.facing == "left" then
    if self.position.x - (self.velocity.x * dt) < self.initialPostion.x then
      self.position.x = self.initialPostion.x
    else
      self.position.x = self.position.x - (self.velocity.x * dt)
    end
  elseif self.position.x <= self.initialPostion.x and self.facing == "left" then
    self.facing = "down"
  elseif self.position.y < self.initialPostion.y and self.facing == "down" then
    if self.position.y + (self.velocity.y * dt) > self.initialPostion.y then
      self.position.y = self.initialPostion.y
    else
      self.position.y = self.position.y + (self.velocity.y * dt)
    end
  elseif self.position.y >= self.initialPostion.y and self.facing == "down" then
    self.facing = "right"
  end
end

function BattleDrone:draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", self.position.x - self.size.x / 2, self.position.y - self.size.y / 2, self.size.x, self.size.y)
  love.graphics.setColor(255, 255, 255)
  -- Just makes a white rectangle that denotes the direction of the drone
  if self.facing == "right" then
	  love.graphics.rectangle("fill", self.position.x - self.size.x / 2 + 16, self.position.y - self.size.y / 2, 8, 16)
  elseif self.facing == "up" then
	  love.graphics.rectangle("fill", self.position.x - self.size.x / 2, self.position.y - self.size.y / 2 - 8, 16, 8)
  elseif self.facing == "left" then
	  love.graphics.rectangle("fill", self.position.x - self.size.x / 2 - 8, self.position.y - self.size.y / 2, 8, 16)
  elseif self.facing == "down" then
	  love.graphics.rectangle("fill", self.position.x - self.size.x / 2, self.position.y - self.size.y / 2 + 16, 16, 8)
  end
end
