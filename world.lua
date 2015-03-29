local class = {} --This is an arbitrary array, I use it as a class that I fill with functions and variables

--[[
World class
This class defines how the world works. Not specific planets or
objects, the entire gameworld. Things like gravity constants and
procedural generation logic are stored here.
]]

class.Chunks = {}
--[[
The world is be made up of chunks; This is an efficient way of
having complex worlds without checking logic against every single
object in the game.
]]

class.Chunks.loaded = {} --Array for keeping track of loaded chunks
class.Chunks.current = 0 --Current chunk


function class.LoadChunk(id)
end

function class.SetCurrentChunk(id)
end

class.NORTH, class.SOUTH, class.EAST, class.WEST = 0, 1, 2, 3

function class.MoveFromChunk(id, dir) --Dir should be one of the above - NSEW (0123)
end

--TODO: All of it

return class