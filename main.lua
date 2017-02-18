HC =  require 'HC'
vector = require 'hump.vector'

require 'Spy'

require 'GameState'
require 'GameStates/SplashScreen'
require 'GameStates/TitleMenu'

function love.load()
  love.window.setTitle("I wish that I had Jesse\'s Girl")

	love.window.setFullscreen(false)
	
	gameTime = 0
  state = GameState:new()
end

function love.update(dt)
  gameTime = gameTime + dt
  
  state:changeState(stateName)
	state:updateState(dt)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.draw()
  state:draw()
end
