Door = {}

function Door:new(x,y) --Creates the door
  local o = {}
  setmetatable(o, {__index = self})

  o.position = vector.new(x,y) -- The position of the door
  o.size = vector.new(32, 96) -- The size of the door
  o.isOpen = false -- bool holds if the door is open or closed
  return o
end

function door:draw() --Will Brabston told us to draw the door
  if isOpen then
		love.graphics.rectangle("fill", o.position.x, o.position.y,o.size.x, o.size.y)
	end
end



function door:open() -- changes the door to open
  o.isOpen = false -- checks if the door is open or not
end
