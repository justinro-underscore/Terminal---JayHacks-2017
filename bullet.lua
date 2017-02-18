bullet = {}
function bullet:new(x,y)
  o= {}
  setMetaTable(o,{__index = self})

  o.position = vector.new(x,y)
  o.velocity = velocity.new(0,0)

  o.VELOCITY_CONSTANT = 4000

  return o
end

function bullet:update(dt)
  local
