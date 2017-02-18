HC =  require 'HC'
vector = require 'hump.vector'

require 'GameState'
require 'GameStates/SplashScreen'
require 'GameStates/TitleMenu'
require 'GameStates/Level01'

require 'Gamepad'
require 'Hacker'
require 'Spy'
require 'Wall'
--require 'Door'

hackerFont = love.graphics.setNewFont("cour.ttf", 20)

function love.load()
  love.window.setTitle("I wish that I had Jesse\'s Girl")
	love.window.setFullscreen(false)

  love.keyboard.setKeyRepeat(true)

  gameTime = 0
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
  if key == "backspace" then
    hacker:keyInput(key)
  elseif key == "return" then
    hacker:keyInput(key)
  end
end

--[[function love.textinput(text)
	hacker:input(text)
end]]

function love.draw()
  state:draw()
end
