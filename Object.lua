local Object = {}
Object.__index = Object

function Object:extend()
	local base = {}
	base.__index = base
	base.super = self
	setmetatable(base, {__index = self})
	return base
end

function Object:is(type)
	local mt = getmetatable(self)

	while mt do
		if mt == type then return true end

		mt = getmetatable(mt)
	end

	return false
end

return Object
