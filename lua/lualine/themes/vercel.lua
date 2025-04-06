local colors = require("vercel.colors")
local config = require("vercel.config")
local M = {}

local bg = config.transparent and "NONE" or colors.editorBackground

M.normal = {
	a = { bg = colors.blue, fg = colors.editorBackground, gui = "bold" },
	b = { bg = bg, fg = colors.commentText },
	c = { bg = bg, fg = colors.editorBackground },
}

M.insert = {
	a = {
		bg = colors.syntaxError,
		fg = colors.editorBackground,
		gui = "bold",
	},
	b = { bg = bg, fg = colors.commentText },
}

M.terminal = {
	a = {
		bg = colors.successText,
		fg = colors.editorBackground,
		gui = "bold",
	},
	b = { bg = bg, fg = colors.commentText },
}

M.command = {
	a = {
		bg = colors.successText,
		fg = colors.editorBackground,
		gui = "bold",
	},
	b = { bg = bg, fg = colors.commentText },
}

M.visual = {
	a = {
		bg = colors.syntaxKeyword,
		fg = colors.editorBackground,
		gui = "bold",
	},
	b = { bg = bg, fg = colors.commentText },
}

M.replace = {
	a = {
		bg = colors.warningText,
		fg = colors.editorBackground,
		gui = "bold",
	},
	b = { bg = bg, fg = colors.commentText },
}

M.inactive = {
	a = { bg = colors.commentText, fg = colors.editorBackground },
	b = { bg = bg, fg = colors.warningText, gui = "bold" },
	c = { bg = bg, fg = colors.warningText },
}

return M
