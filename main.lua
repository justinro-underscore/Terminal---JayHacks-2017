HC =  require 'HC'
vector = require 'hump.vector'

require 'Spy'

function love.load()
  love.window.setTitle("I wish that I had Jesse\'s Girl")

	love.window.setFullscreen(true)

	player = Spy:new(200, 200)
end

function love.update(dt)
	player:update(dt)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.draw()
	player:draw()
end
