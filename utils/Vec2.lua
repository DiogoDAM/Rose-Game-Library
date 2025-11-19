local Vec2 = {}
Vec2.__index = Vec2

function Vec2.new(x, y)
	local self = setmetatable({}, Vec2)

	self.x = x or 0
	self.y = y or 0

	return self
end

function Vec2:is_zero() return self.x == 0 and self.y == 0 end

function Vec2:get_magnetude()
	return math.sqrt(self.x * self.x - self.y * self.y)
end

function Vec2:normalize()
	local m = self:get_magnetude()

	if m == 0 then
		self.x = 0
		self.y = 0
	else
		self.x = self.x / m
		self.y = self.y / m
	end
end

function Vec2:get_distance(target)
	if getmetatable(target) == Vec2 then
		return (target-self):get_magnetude()
	end
end

function Vec2:move(vec)
	if getmetatable(vec) == Vec2 then
		self.x = self.x + vec.x
		self.y = self.y + vec.y
	end
end

function Vec2:__add(other)
	if type(other) == 'number' then
		return Vec2.new(self.x + other, self.y + other)
	elseif getmetatable(other) == Vec2 then
		return Vec2.new(self.x + other.x, self.y + other.y)
	end
end

function Vec2:__sub(other)
	if type(other) == 'number' then
		return Vec2.new(self.x - other, self.y - other)
	elseif getmetatable(other) == Vec2 then
		return Vec2.new(self.x - other.x, self.y - other.y)
	end
end

function Vec2:__mul(other)
	if type(other) == 'number' then
		return Vec2.new(self.x * other, self.y * other)
	elseif getmetatable(other) == Vec2 then
		return Vec2.new(self.x * other.x, self.y * other.y)
	end
end

function Vec2:__div(other)
	if type(other) == 'number' then
		return Vec2.new(self.x / other, self.y / other)
	elseif getmetatable(other) == Vec2 then
		return Vec2.new(self.x / other.x, self.y / other.y)
	end
end

function Vec2:__eq(other)
	if getmetatable(other) == Vec2 then
		return self.x == other.x and self.y == other.y
	end
end

function Vec2:__lt(other)
	if getmetatable(other) == Vec2 then
		return self.x < other.x and self.y < other.y
	end
end

function Vec2:__le(other)
	if getmetatable(other) == Vec2 then
		return self.x <= other.x and self.y <= other.y
	end
end

function Vec2:__unm()
	self.x = -self.x
	self.y = -self.y
end

function Vec2:__tostring()
	return ("%d, %d"):format(self.x, self.y)
end

return Vec2
