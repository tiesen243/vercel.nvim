local config = require("vercel.init").config
local colors = require("vercel.colors").getColors(config.theme)

local M = {}

M.normal = {
	a = { fg = colors.background, bg = colors.blue, gui = "bold" },
	b = { fg = colors.blue, bg = colors.background },
	c = { fg = colors.foreground, bg = config.transparent and "NONE" or colors.popup },
}

M.visual = {
	a = { fg = colors.background, bg = colors.yellow, gui = "bold" },
	b = { fg = colors.yellow, bg = colors.background },
	c = { fg = colors.foreground, bg = config.transparent and "NONE" or colors.popup },
}

M.inactive = {
	a = { fg = colors.background, bg = colors.secondary, gui = "bold" },
	b = { fg = colors.secondary, bg = colors.background },
	c = { fg = colors.foreground, bg = config.transparent and "NONE" or colors.popup },
}

M.replace = {
	a = { fg = colors.background, bg = colors.red, gui = "bold" },
	b = { fg = colors.red, bg = colors.background },
	c = { fg = colors.foreground, bg = config.transparent and "NONE" or colors.popup },
}

M.insert = {
	a = { fg = colors.background, bg = colors.green, gui = "bold" },
	b = { fg = colors.green, bg = colors.background },
	c = { fg = colors.foreground, bg = config.transparent and "NONE" or colors.popup },
}

M.terminal = {
	a = { fg = colors.background, bg = colors.puple, gui = "bold" },
	b = { fg = colors.puple, bg = colors.background },
	c = { fg = colors.foreground, bg = config.transparent and "NONE" or colors.popup },
}

M.command = {
	a = { fg = colors.background, bg = colors.orange, gui = "bold" },
	b = { fg = colors.orange, bg = colors.background },
	c = { fg = colors.foreground, bg = config.transparent and "NONE" or colors.popup },
}

return M
