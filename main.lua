console = require("console")

--some globals
g_console_active = false
g_game_active = false


function love.load()
	console.writeline("Loading resources...")
	defaultFont = love.graphics.newFont("content/resources/Junction.ttf", 12)
	love.graphics.setFont(defaultFont)
	console.writeline("Font loaded.")
	console.writeline("Done.")
	console.writeline("Setting user preferences...")
	love.keyboard.setKeyRepeat(true)
	console.writeline("Done.")
end

function love.update( dt )
end

function love.draw()
	if g_console_active then
		console.draw()
	end
end

function love.mousepressed( x, y, button )
end

function love.mousereleased( x, y, button )
end

function love.keypressed( key, isrepeat )
	if key == '`' then
		g_console_active = not g_console_active
	end

	if g_console_active then
		if key == 'return' then
			console.sendline()
		elseif key == 'backspace' then
			console.backspace()
		end
	end
end

function love.keyreleased( key, isrepeat )
end

function love.focus( focus )
end

function love.textinput(text)
	if g_console_active and text ~= '`' and text ~= '~' then
		console.appendline(text)
	end
end

function love.threaderror( thread, errorstr )
end

function love.quit()
end