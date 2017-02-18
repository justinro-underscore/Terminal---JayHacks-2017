bullet = {}
function bullet:new(x,y,velocity_x,velocity_y)
  o= {}
  setMetaTable(o,{__index = self})
  o.size(1,1)
  o.position = vector.new(x,y)
  o.velocity = velocity.new(velocity_x,velocity_y)

  o.VELOCITY_CONSTANT = 4000

  return o
end

function bullet:update(dt)
  self.position = self.position + self.velocity.velocity_x *dt
end

function bullet:draw()
  love.graphics.circle(circle, self.position.x, self.position.y)
end

function bullet:collision()

end
