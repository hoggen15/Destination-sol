-- Load some default values for our rectangle.
function love.load()
	love.keyboard.setKeyRepeat(true)
	 playerimage= love.graphics.newImage('Ship.png')
	 enemyimage= love.graphics.newImage('Enemy.png')
	 backgroundimage= love.graphics.newImage('background.png')
    x, y, w, h = 20, 20, 60, 20;
    playerx = 400
    playery = 300
    playerr = math.rad(0)
    enemyx = 100
    enemyy = 100
end

-- Increase the size of the rectangle every frame.
function love.update(dt)
    playerspeed= 200 * dt
    enemyspeed= .8 * playerspeed
    	if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
		playerx = playerx+playerspeed
		playerr = 0
	end
	if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
		playerx=playerx-playerspeed
		playerr= math.rad(180)
	end
	if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
		playery = playery+playerspeed
		playerr= math.rad(90)
	end
	if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
		playery=playery-playerspeed
		playerr=math.rad(270)
	end
	local xv = playerx - enemyx
	local yv = playery - enemyy

	local m = math.sqrt(xv^2+ yv^2)

	local nxv = xv / m
	local nyv = yv / m

	enemyx = enemyx + nxv * enemyspeed
	enemyy = enemyy + nyv * enemyspeed
end
function love.keypressed(key, isrepeat)
	
	if key == 'escape'  then
		love.event.quit()
	end
end
function love.draw()
	love.graphics.draw(backgroundimage, 0, 0, 0, .8, .75)
	love.graphics.draw(playerimage, playerx, playery, playerr, 0.5, 0.5, 64, 64)
	love.graphics.draw(enemyimage, enemyx, enemyy, 0, 1, 1, 32, 32)
	love.graphics.print(playerx .. ', '..playery, 10, 10)
end