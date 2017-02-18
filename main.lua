require "GameState"

function love.load()
  love.window.setTitle("I wish that I had Jesse\'s Girl")

	love.window.setFullscreen(false)

  gameTime = 0
  stateName = ""
  state = GameState:new()
  --state:changeState(stateName)
end

function love.update(dt)
  gameTime = gameTime + dt
  if gameTime <= 10 then
    stateName = "splash"
  else
    stateName = "titleScreen"
  end
--  state:changeState(stateName)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.draw()
  --state:draw()
  love.graphics.print(state.test)
end
