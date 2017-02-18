require "Hacker"

function love.load()
  love.window.setTitle("I wish that I had Jesse\'s Girl")

	love.window.setFullscreen(false)

  gameTime = 0
  hacker = Hacker:new()
end

function love.update(dt)
  gameTime = gameTime + dt
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
  hacker:draw()
end
