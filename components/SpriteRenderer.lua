local Vec2 = require("rose.utils.Vec2")

local SpriteRenderer = {}
SpriteRenderer.__index = SpriteRenderer

function SpriteRenderer.new(sprite)
	local self = setmetatable({}, SpriteRenderer)

	self.sprite = sprite or error("SpriteRenderer doesn't has a Sprite")
	self.color = {1,1,1}
	self.pos = Vec2.new()
	self.rotation = 0
	self.scale = Vec2.new(1,1)
	self.fliph = 1
	self.flipv = 1
	self.origin = Vec2.new()

	return self
end

function SpriteRenderer:draw()
	love.graphics.setColor(self.color)
	love.graphics.draw(
		self.sprite.texture,
		self.sprite.quad,
		self.pos.x + self.entity:get_pos().x,
		self.pos.y + self.entity:get_pos().y)

	love.graphics.setColor({1,1,1})
end

return SpriteRenderer
