HC =  require 'HC'
vector = require 'hump.vector'

require 'GameState'
require 'GameStates/SplashScreen'
require 'GameStates/TitleMenu'
require 'GameStates/Level01'
require 'GameStates/Level02'
require 'GameStates/finalLevel'

require 'Gamepad'
require 'Hacker'
require 'HackerCommands'
require 'Spy'
require 'Wall'
require 'Trap'
require 'Terminal'
require 'VBox'
require 'Door'
require 'Bullet'
require 'Turret'
require 'WinObject'

objectFont = love.graphics.setNewFont("cour.ttf", 7)
hackerFont = love.graphics.setNewFont("cour.ttf", 13)
tutorialFont = love.graphics.setNewFont("cour.ttf", 20)

menuSong = love.audio.newSource("Sound/Game Menu Track.wav") -- import music
gameSong = love.audio.newSource("Sound/Gameplay Track.wav")
deathSound = love.audio.newSource("Sound/Death Noise.wav")
winSound = love.audio.newSource("Sound/Victory Screen.wav")

function love.load()
  love.window.setTitle("Terminal")
	love.window.setFullscreen(false)
  love.graphics.setDefaultFilter("nearest", "nearest")

  --sets up global reference for all objects
  gamepadList = {}
  hackerList = {}
  spyList = {}
  wallList = {}
  terminalList = {}
  vboxList = {}
  doorList = {}
  trapList = {}
  bulletList = {}
  turretList = {}
  winObjectList = {}

  updateableLists = {gamepadList, turretList, bulletList, hackerList, spyList}
  drawableLists = {winObjectList, bulletList, turretList, wallList, doorList, trapList, vboxList, terminalList, spyList}

  local joysticks = love.joystick.getJoysticks()
	table.insert(gamepadList, Gamepad:new(joysticks[1]))

	gameTime = 0
  state = GameState:new()

  love.keyboard.setKeyRepeat(true)

end

camera = {}
camera.x = 0
camera.y = 0
camera.scale = 1

function camera:adjust()
  self.x = spyList[1].position.x
  self.y = spyList[1].position.y
end

function camera:set()
  love.graphics.push()
  love.graphics.scale(1 / self.scale, 1 / self.scale)
  local winX, winY = love.window.getMode()
  love.graphics.translate(-(self.x - (winX * .5 * self.scale)), -(self.y - (winY * .33 * self.scale)))
end

function camera:reset()
  love.graphics.pop()
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
    state:keyInput(key)
  elseif key == "return" then
    state:keyInput(key)
  end
end

function love.textinput(text)
	state:input(text)
end

function love.draw()
  state:draw()
end
