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
require 'Trap'
require 'dirt'
--require 'Door'

hackerFont = love.graphics.setNewFont("cour.ttf", 20)
dirt = love.graphics.newImage("Light Skin Dirt Bitches.png")
function love.load()
  love.window.setTitle("I wish that I had Jesse\'s Girl")
	love.window.setFullscreen(false)
  background = love.graphics.newCanvas() -- create a background canvas to draw all background stars (default size is the screen dimensions
	love.graphics.setCanvas(background)
  local w, h = love.window.getMode()
  local numdirt= w*h
  local dirt = {}
  local j=1
	for i = 1, numdirt do
		table.insert(dirt, dirt:new(j,i))
    j=j+1
	end

	for i, v in ipairs(dirt) do
		v:draw()
	end
    love.graphics.setCanvas()



	gameTime = 0
  state = GameState:new()
  --Trap =Trap:new(23,34)
  love.keyboard.setKeyRepeat(true)
  --hacker = Hacker:new()
end

function love.update(dt)
  gameTime = gameTime + dt

  state:changeState(stateName)
	state:updateState(dt)

  --hacker:update(dt)
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
  --Spy:draw()
  --Trap:draw()
  --hacker:draw()
end
