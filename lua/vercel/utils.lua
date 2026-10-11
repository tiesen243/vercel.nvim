local M = {}

--- Convert hex color to RGB.
--- @param hex string
--- @return table
local function hex_to_rgb(hex)
	local hex_type = "[abcdef0-9][abcdef0-9]"
	local pat = "^#(" .. hex_type .. ")(" .. hex_type .. ")(" .. hex_type .. ")$"
	hex = string.lower(hex)

	assert(string.find(hex, pat) ~= nil, "hex_to_rgb: invalid hex: " .. tostring(hex))

	local red, green, blue = string.match(hex, pat)
	return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

--- Mix two colors together.
--- @param fg string
--- @param bg string
--- @param alpha number
function M.mix(fg, bg, alpha)
	---@diagnostic disable-next-line: param-type-mismatch, cast-local-type
	bg = hex_to_rgb(bg)
	---@diagnostic disable-next-line: param-type-mismatch, cast-local-type
	fg = hex_to_rgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

--- Mix two colors together.
--- @param color string
--- @param value number
--- @param base? string
function M.shade(color, value, base)
	if base == nil then
		base = vim.o.background == "light" and "#ffffff" or "#000000"
	end

	return M.mix(color, base, math.abs(value))
end

return M
