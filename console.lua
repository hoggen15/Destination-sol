local class = {}

class.length = 40
class.strs = {}
class.str = ""

function class.draw()
	love.graphics.setColor({230,230,230,180})
	love.graphics.rectangle("fill", 10, 10, love.graphics.getWidth() - 20, love.graphics.getHeight() - 20)

	b = false --alternating colors

	for i=1,class.length do
		if b then
			love.graphics.setColor({230,230,230,180})
			b = false
		else
			love.graphics.setColor({210,210,210,180})
			b = true
		end
		love.graphics.rectangle("fill", 15, love.graphics.getHeight() - 30 - i*12, love.graphics.getWidth() - 30, 12)
		love.graphics.setColor(0,0,0,180)
		if class.strs[i] == nil then
			break
		else
			love.graphics.print(class.strs[i], 18, love.graphics.getHeight() - 30 - (i)*12)
		end
	end
	love.graphics.print(class.str, 16, love.graphics.getHeight()-30)

end

function class.sendline()
	for i=class.length,0,-1 do
		class.strs[i] = class.strs[i-1]
	end

	class.strs[1] = class.str

	class.str = ""
end

function class.backspace() --Better way to do this?
	class.str = string.sub(class.str, 0, string.len(class.str)-1)
end

function class.appendline(c)
	class.str = class.str .. c
end

return class