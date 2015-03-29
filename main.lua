console = require("console")

function love.load()
	defaultFont = love.graphics.newFont("content/resources/Junction.ttf", 12)
	love.graphics.setFont(defaultFont)

	love.keyboard.setKeyRepeat(true)
end

function love.update( dt )
end

function love.draw()
	console.draw()
end

function love.mousepressed( x, y, button )
end

function love.mousereleased( x, y, button )
end

function love.keypressed( key, isrepeat )
	if key == 'return' then
		console.sendline()
	elseif key == 'backspace' then
		console.backspace()
	end
end

function love.keyreleased( key, isrepeat )
end

function love.focus( focus )
end

function love.textinput(text)
	--console.sendline()
	console.appendline(text)
end

function love.threaderror( thread, errorstr )

end

function love.quit()
end