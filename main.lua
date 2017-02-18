HC =  require 'HC'
vector = require 'hump.vector'

require 'Spy'

require 'GameState'
require 'GameStates/SplashScreen'
require 'GameStates/TitleMenu'
require 'Hacker'

hackerFont = love.graphics.setNewFont("cour.ttf", 20)

function love.load()
  love.window.setTitle("I wish that I had Jesse\'s Girl")

	love.window.setFullscreen(false)
	
	gameTime = 0
  state = GameState:new()
  
  love.keyboard.setKeyRepeat(true)
  hacker = Hacker:new()
end

function love.update(dt)
  gameTime = gameTime + dt
  
  state:changeState(stateName)
	state:updateState(dt)

  hacker:update(dt)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
  if key == "backspace" then
    hacker:keyInput(key)
  elseif key == "return" then
    hacker:keyInput(key)
  end
end

function love.textinput(text)
  hacker:input(text)
end

function love.draw()
  state:draw()
  hacker:draw()
end
