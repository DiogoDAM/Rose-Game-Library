local Vec2 = require("rose.utils.Vec2")
local Object = require("rose.Object")
local List = require("rose.core.ComponentsList")

local Entity = Object:extend()

function Entity:new(x, y)
	self.local_pos = Vec2.new(x or 0, y or 0)
	self.local_rotation = 0
	self.local_scale = Vec2.new(1,1)
	self.width = 16
	self.height = 16
	self.color = {1,1,1}
	self.origin = Vec2.new()
	self.components = List.new(self)

	return self
end

function Entity:get_pos()
	if self.parent == nil then
		return self.local_pos
	else
		return self.parent:get_pos() + self.local_pos
	end
end

function Entity:add_component(comp)
	self.components:add(comp)
end

function Entity:start()
	self.components:update_list()
	self.components:start()
end

function Entity:update(dt)
	self.components:update(dt)

	self.components:update_list()
end

function Entity:draw()
	self.components:draw()
end

return Entity
