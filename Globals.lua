function _G.table.contains_value(list, value)
	for _, v in ipairs(list) do
		if v == value then return true end
	end

	return false
end

function _G.table.contains_key(list, key)
	for k, _ in pairs(list) do
		if k == key then return true end
	end

	return false
end

function _G.table.remove_value(list, value)
	for k, v in ipairs(list) do
		if v == value then table.remove(list, k) end
	end
end

function _G.table.clear(list)
	for k, _ in ipairs(list) do
		table.remove(list, k)
	end
end

function _G.table.filter(list, callback)
	local new_list = {}
	for k, v in ipairs(list) do
		if callback(v, k) then table.insert(new_list, v) end
	end

	return new_list
end

function _G.table.map(list, callback)
	local new_list = {}
	for k, v in ipairs(list) do
		table.insert(new_list, callback(k, v))
	end

	return new_list
end
