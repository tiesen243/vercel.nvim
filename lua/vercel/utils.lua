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
	---@diagnostic disable-next-line: cast-local-type
	bg = hex_to_rgb(bg)
	---@diagnostic disable-next-line: cast-local-type
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
	if vim.o.background == "light" then
		if base == nil then
			base = "#000000"
		end

		return M.mix(color, base, math.abs(value))
	else
		if base == nil then
			base = "#ffffff"
		end

		return M.mix(color, base, math.abs(value))
	end
end

--- Convert hsl color values to hex.
---@param h number
---@param s number
---@param l number
---@return string
function M.hsl(h, s, l)
	s = s / 100
	l = l / 100

	local c = (1 - math.abs(2 * l - 1)) * s
	local x = c * (1 - math.abs((h / 60) % 2 - 1))
	local m = l - c / 2

	local r, g, b = 0, 0, 0

	if h < 60 then
		r, g, b = c, x, 0
	elseif h < 120 then
		r, g, b = x, c, 0
	elseif h < 180 then
		r, g, b = 0, c, x
	elseif h < 240 then
		r, g, b = 0, x, c
	elseif h < 300 then
		r, g, b = x, 0, c
	else
		r, g, b = c, 0, x
	end

	-- Convert RGB [0,1] to [0,255], apply m
	r = math.floor((r + m) * 255 + 0.5)
	g = math.floor((g + m) * 255 + 0.5)
	b = math.floor((b + m) * 255 + 0.5)

	-- Return HEX string
	return string.format("#%02X%02X%02X", r, g, b)
end

return M
