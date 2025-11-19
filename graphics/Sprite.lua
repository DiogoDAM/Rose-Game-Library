local Sprite = {}
Sprite.__index = Sprite

function Sprite.new(texture, x, y, w, h)
	local self = setmetatable({}, Sprite)

	self.texture = texture
	self.x = x or 0
	self.y = y or 0
	self.w = w or 0
	self.h = h or 0
	self.quad = love.graphics.newQuad(self.x, self.y, self.w, self.h, self.texture)

	return self
end

function Sprite:set_pos(x, y)
	self.x = x or self.x
	self.y = y or self.y
	self.quad = love.graphics.newQuad(self.x, self.y, self.w, self.h, self.texture)
end

function Sprite:set_size(w, h)
	self.w = w or self.w
	self.h = h or self.h
	self.quad = love.graphics.newQuad(self.x, self.y, self.w, self.h, self.texture)
end

return Sprite
