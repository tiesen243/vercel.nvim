local config = require("vercel.config")
local colors = require("vercel.colors")

local M = {}

M.normal = {
	a = { fg = colors.editorBackground, bg = colors.syntaxConstant, gui = "bold" },
	b = { fg = colors.syntaxConstant, bg = colors.editorBackground },
	c = { fg = colors.mainText, bg = config.transparent and "NONE" or colors.popupBackground },
}

M.visual = {
	a = { fg = colors.editorBackground, bg = colors.warningText, gui = "bold" },
	b = { fg = colors.warningText, bg = colors.editorBackground },
	c = { fg = colors.mainText, bg = config.transparent and "NONE" or colors.popupBackground },
}

M.inactive = {
	a = { fg = colors.editorBackground, bg = colors.editorBackground, gui = "bold" },
	b = { fg = colors.commentText, bg = colors.editorBackground },
	c = { fg = colors.mainText, bg = config.transparent and "NONE" or colors.popupBackground },
}

M.replace = {
	a = { fg = colors.editorBackground, bg = colors.errorText, gui = "bold" },
	b = { fg = colors.errorText, bg = colors.editorBackground },
	c = { fg = colors.mainText, bg = config.transparent and "NONE" or colors.popupBackground },
}

M.insert = {
	a = { fg = colors.editorBackground, bg = colors.successText, gui = "bold" },
	b = { fg = colors.successText, bg = colors.editorBackground },
	c = { fg = colors.mainText, bg = config.transparent and "NONE" or colors.popupBackground },
}

M.terminal = {
	a = { fg = colors.editorBackground, bg = colors.syntaxFunction, gui = "bold" },
	b = { fg = colors.syntaxFunction, bg = colors.editorBackground },
	c = { fg = colors.mainText, bg = config.transparent and "NONE" or colors.popupBackground },
}

M.command = {
	a = { fg = colors.editorBackground, bg = colors.syntaxKeyword, gui = "bold" },
	b = { fg = colors.syntaxKeyword, bg = colors.editorBackground },
	c = { fg = colors.ma, bg = config.transparent and "NONE" or colors.popupBackground },
}

return M
