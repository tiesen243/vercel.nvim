local hsl = require("vercel.utils").hsl

local M = {}

---@param theme "light" | "dark"
M.getColors = function(theme)
	local colors = {}
	if theme == "light" or vim.o.background == "light" then
		colors.background = hsl(0, 0, 89.8)
		colors.foreground = hsl(240, 10, 3.9)
		colors.mutedForeground = hsl(0, 0, 64)

		colors.border = hsl(0, 0, 85)
		colors.lineNumber = hsl(0, 0, 9)
		colors.lineNumberActive = hsl(0, 0, 74)
		colors.menu = hsl(0, 0, 74)
		colors.popup = hsl(240, 4.8, 95.9)
		colors.select = hsl(0, 0, 85)

		colors.blue = hsl(211, 100, 42)
		colors.green = hsl(142.1, 76.2, 36.3)
		colors.orange = hsl(24, 92, 46)
		colors.puple = hsl(274, 71, 43)
		colors.red = hsl(336, 65, 45)
		colors.yellow = hsl(24, 79, 43)

		colors.property = hsl(0, 0, 4)
		colors.string = hsl(139, 79, 28)
	else
		colors.background = hsl(240, 10, 3.9)
		colors.foreground = hsl(0, 0, 93)
		colors.mutedForeground = hsl(0, 0, 64)

		colors.border = hsl(0, 0, 13)
		colors.lineNumber = hsl(0, 0, 30)
		colors.lineNumberActive = hsl(0, 0, 95)
		colors.menu = hsl(0, 0, 17)
		colors.popup = hsl(240, 3.7, 15.9)
		colors.select = hsl(0, 0, 93)

		colors.blue = hsl(210, 100, 66)
		colors.green = hsl(142.1, 76.2, 36.3)
		colors.orange = hsl(25, 100, 72)
		colors.puple = hsl(275, 80, 71)
		colors.red = hsl(341, 90, 67)
		colors.yellow = hsl(40, 71, 73)

		colors.property = hsl(0, 0, 93)
		colors.string = hsl(131, 43, 57)
	end

	return colors
end

return M
