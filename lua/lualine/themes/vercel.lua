local config = require("vercel.init").config
local tokens = require("vercel.tokens").getTokens(config.theme)

local M = {}

M.normal = {
	a = { fg = tokens.background[100], bg = tokens.blue[600], gui = "bold" },
	b = { fg = tokens.blue[600], bg = tokens.background[100] },
	c = { fg = tokens.gray[1000], bg = config.transparent and "NONE" or tokens.gray[100] },
}

M.visual = {
	a = { fg = tokens.background[100], bg = tokens.amber[600], gui = "bold" },
	b = { fg = tokens.amber[600], bg = tokens.background[100] },
	c = { fg = tokens.gray[1000], bg = config.transparent and "NONE" or tokens.gray[100] },
}

M.inactive = {
	a = { fg = tokens.background[100], bg = tokens.gray[900], gui = "bold" },
	b = { fg = tokens.gray[900], bg = tokens.background[100] },
	c = { fg = tokens.gray[1000], bg = config.transparent and "NONE" or tokens.gray[100] },
}

M.replace = {
	a = { fg = tokens.background[100], bg = tokens.red[600], gui = "bold" },
	b = { fg = tokens.red[600], bg = tokens.background[100] },
	c = { fg = tokens.gray[1000], bg = config.transparent and "NONE" or tokens.gray[100] },
}

M.insert = {
	a = { fg = tokens.background[100], bg = tokens.green[600], gui = "bold" },
	b = { fg = tokens.green[600], bg = tokens.background[100] },
	c = { fg = tokens.gray[1000], bg = config.transparent and "NONE" or tokens.gray[100] },
}

M.terminal = {
	a = { fg = tokens.background[100], bg = tokens.purple[600], gui = "bold" },
	b = { fg = tokens.purple[600], bg = tokens.background[100] },
	c = { fg = tokens.gray[1000], bg = config.transparent and "NONE" or tokens.gray[100] },
}

M.command = {
	a = { fg = tokens.background[100], bg = tokens.amber[600], gui = "bold" },
	b = { fg = tokens.amber[600], bg = tokens.background[100] },
	c = { fg = tokens.gray[1000], bg = config.transparent and "NONE" or tokens.gray[100] },
}

return M
