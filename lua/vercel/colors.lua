local hsl = require("vercel.utils").hsl

local M = {
	standardWhite = "#ffffff",
	standardBlack = "#000000",
}

if vim.o.background == "light" then
	M.background = hsl(0, 0, 100)
	M.foreground = hsl(240, 10, 3.9)
	M.mutedForeground = hsl(0, 0, 64)

	M.border = hsl(0, 0, 85)
	M.lineNumber = hsl(0, 0, 9)
	M.lineNumberActive = hsl(0, 0, 74)
	M.menu = hsl(0, 0, 74)
	M.popup = hsl(240, 4.8, 95.9)
	M.select = hsl(0, 0, 85)

	M.blue = hsl(211, 100, 42)
	M.green = hsl(142.1, 76.2, 36.3)
	M.orange = hsl(24, 92, 46)
	M.puple = hsl(274, 71, 43)
	M.red = hsl(336, 65, 45)
	M.yellow = hsl(24, 79, 43)

	M.comment = hsl(0, 0, 40)
	M.error = hsl(3, 62, 42)
	M.property = hsl(0, 0, 4)
	M.string = hsl(139, 79, 28)
else
	M.background = hsl(240, 10, 3.9)
	M.foreground = hsl(0, 0, 93)
	M.mutedForeground = hsl(0, 0, 64)

	M.border = hsl(0, 0, 13)
	M.lineNumber = hsl(0, 0, 30)
	M.lineNumberActive = hsl(0, 0, 95)
	M.menu = hsl(0, 0, 17)
	M.popup = hsl(240, 3.7, 15.9)
	M.select = hsl(0, 0, 93)

	M.blue = hsl(210, 100, 66)
	M.green = hsl(142.1, 76.2, 36.3)
	M.orange = hsl(25, 100, 72)
	M.puple = hsl(275, 80, 71)
	M.red = hsl(341, 90, 67)
	M.yellow = hsl(40, 71, 73)

	M.comment = hsl(0, 0, 64)
	M.error = hsl(5, 61, 54)
	M.property = hsl(0, 0, 93)
	M.string = hsl(131, 43, 57)
end

return M
