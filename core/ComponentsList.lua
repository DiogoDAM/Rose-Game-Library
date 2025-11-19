require("rose.Globals")

local ComponentsList = {}
ComponentsList.__index = ComponentsList

function ComponentsList.new(max_size)
	local self = setmetatable({}, ComponentsList)

	self.objects = {}
	self._toadd = {}
	self._toremove = {}
	self.max_size = max_size or 100
	self.entity = nil

	return self
end

function ComponentsList:get_size() return #self.objects + #self._toadd end

function ComponentsList:add(obj)
	table.insert(self._toadd, obj)
end

function ComponentsList:remove(obj)
	if table.contains_value(self._toadd, obj) then table.remove_value(self._toadd, obj)
	else table.insert(self._toremove, obj)
	end
end

function ComponentsList:contains(obj)
	return table.contains_value(self._toadd, obj) or table.contains_value(self.objects, obj)
end

function ComponentsList:update_list()
	if #self._toadd > 0 then
		for _, v in pairs(self._toadd) do
			table.insert(self.objects, v)
			v.entity = self.entity
			if v.on_added then v:on_added() end
		end

		table.clear(self._toadd)
	end

	if #self._toremove > 0 then
		for _, v in pairs(self._toremove) do
			table.remove_value(self.objects, v)
			v.entity = nil
			if v.on_removed then v:on_removed() end
		end

		table.clear(self._toremove)
	end
end

function ComponentsList:start()
	for _, v in pairs(self.objects) do
		if v.start then v:start() end
	end
end

function ComponentsList:update(dt)
	for _, v in pairs(self.objects) do
		if v.update then v:update(dt) end
	end
end

function ComponentsList:draw()
	for _, v in pairs(self.objects) do
		if v.draw then v:draw() end
	end
end

return ComponentsList

