local class = {}

--[[
Console Class
This is for debug stuff. (aka cheat codes)
]]

class.length = 40 --40 lines works well for most sizes, maybe make it resizable later
class.strs = {} --Stores all the lines
class.str = "" --Input buffer
class.tmpstr = "" --Alternate buffer for the computer to send data through

local bstart = false --alternating colors, creates scrolling effect and improves readability

function class.draw()
	love.graphics.setColor({230,230,230,180}) --Set color for a light-gray background
	love.graphics.rectangle("fill", 10, 10, love.graphics.getWidth() - 20, love.graphics.getHeight() - 20) --draw background

	b = bstart --for alternating colors

	for i=1,class.length do --for every line that we can have...
		if b then
			love.graphics.setColor({230,230,230,180}) --light color if 'b' is true
			b = false --swap
		else
			love.graphics.setColor({210,210,210,180}) --darker color if 'b' is false
			b = true --swap
		end
		love.graphics.rectangle("fill", 15, love.graphics.getHeight() - 30 - i*12, love.graphics.getWidth() - 30, 12) --draw the line background
		love.graphics.setColor(0,0,0,180) --set color for font, black with a bit of alpha
		if class.strs[i] ~= nil then --if the array slot contains something, draw it
			love.graphics.print(class.strs[i], 18, love.graphics.getHeight() - 30 - (i)*12)
		end
	end
	love.graphics.setColor(190,190,190,180)
	love.graphics.rectangle("fill", 15, love.graphics.getHeight()-30, love.graphics.getWidth() - 30, 12)
	love.graphics.setColor(0,0,0,180) --set color for font, black with a bit of alpha
	love.graphics.print(class.str, 16, love.graphics.getHeight()-30) --draw the input buffer
	
end

function class.writeline(str)
	class.tmpstr = class.str --save the user's input
	class.str = str --replace it with the new input
	class.sendline() --send it
	class.str = class.tmpstr --put the user's input back
end

function class.sendline() --send the current line to the console
	for i=class.length,0,-1 do
		class.strs[i] = class.strs[i-1] --cycle out all the lines to the next one up, destroys top line
	end

	class.strs[1] = class.str --set the bottom line to our input

	--TODO: process the line

	class.str = "" --empty the input buffer

	if bstart then --swap out bstart
		bstart = false
	else
		bstart = true
	end
end

function class.backspace() --Better way to do this? Not a massive problem...
	class.str = string.sub(class.str, 0, string.len(class.str)-1) --take the current string and cut off the last character
end

function class.appendline(c) --Add a character to the buffer.
	class.str = class.str .. c
end

return class