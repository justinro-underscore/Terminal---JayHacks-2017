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
  stateName = ""
  state = GameState:new()
	
	player = Spy:new(200, 200)
end

function love.update(dt)
  gameTime = gameTime + dt
	player:update()
  if gameTime <= 10 then
    stateName = "splash"
  else
    stateName = "titleScreen"
  end
  state:changeState(stateName)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.draw()
	player:draw()
  state:draw()
end
