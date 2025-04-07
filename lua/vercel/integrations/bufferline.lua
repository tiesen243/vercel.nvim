local colors = require("vercel.colors")

local M = {}

--- Bufferline highlights
--- @param options Options
function M.highlights(options)
	local bg = options.transparent and "NONE" or colors.editorBackground

	return {
		background = { bg = bg },
		buffer_visible = { fg = colors.lineNumberTextActive, bg = bg },
		buffer_selected = {
			fg = colors.mainText,
			bg = colors.editorBackground,
		},
		duplicate = {
			fg = colors.mainText,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		duplicate_visible = {
			fg = colors.mainText,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		duplicate_selected = {
			fg = colors.mainText,
			bg = colors.editorBackground,
			italic = options.italics.bufferline or false,
		},

		tab = { fg = colors.mainText, bg = bg },
		tab_selected = {
			fg = colors.mainText,
			bg = colors.editorBackground,
		},
		tab_close = { fg = colors.syntaxError, bg = bg },
		indicator_selected = {
			fg = colors.syntaxFunction,
			bg = colors.editorBackground,
			bold = true,
		},

		separator = { fg = colors.editorBackground, bg = bg },
		separator_selected = {
			fg = colors.editorBackground,
			bg = colors.editorBackground,
		},
		separator_visible = { fg = colors.editorBackground, bg = bg },
		offset_separator = { fg = colors.editorBackground, bg = bg },
		tab_separator = { fg = colors.editorBackground, bg = bg },
		tab_separator_selected = {
			fg = colors.editorBackground,
			bg = colors.editorBackground,
		},

		close_button = { fg = colors.lineNumberTextActive, bg = bg },
		close_button_visible = { fg = colors.syntaxError, bg = bg },
		close_button_selected = {
			fg = colors.syntaxError,
			bg = colors.editorBackground,
		},

		fill = { bg = bg },

		numbers = { fg = colors.lineNumberTextActive, bg = bg },
		numbers_visible = { fg = colors.lineNumberTextActive, bg = bg },
		numbers_selected = {
			fg = colors.mainText,
			bg = colors.editorBackground,
			italic = options.italics.bufferline or false,
		},

		error = { fg = colors.syntaxError, bg = bg },
		error_visible = { fg = colors.syntaxError, bg = bg },
		error_selected = {
			fg = colors.syntaxError,
			bg = colors.editorBackground,
			italic = options.italics.bufferline or false,
		},
		error_diagnostic = { fg = colors.syntaxError, bg = bg },
		error_diagnostic_visible = { fg = colors.syntaxError, bg = bg },
		error_diagnostic_selected = {
			fg = colors.syntaxError,
			bg = colors.editorBackground,
		},

		warning = { fg = colors.warningText, bg = bg },
		warning_visible = { fg = colors.warningText, bg = bg },
		warning_selected = {
			fg = colors.warningText,
			bg = colors.editorBackground,
			italic = options.italics.bufferline or false,
		},
		warning_diagnostic = { fg = colors.warningText, bg = bg },
		warning_diagnostic_visible = { fg = colors.warningText, bg = bg },
		warning_diagnostic_selected = {
			fg = colors.warningText,
			bg = colors.editorBackground,
		},

		info = { fg = colors.syntaxConstant, bg = bg },
		info_visible = { fg = colors.syntaxConstant, bg = bg },
		info_selected = {
			fg = colors.syntaxConstant,
			bg = colors.editorBackground,
			italic = options.italics.bufferline or false,
		},
		info_diagnostic = { fg = colors.syntaxConstant, bg = bg },
		info_diagnostic_visible = { fg = colors.syntaxConstant, bg = bg },
		info_diagnostic_selected = {
			fg = colors.syntaxConstant,
			bg = colors.editorBackground,
		},

		hint = { fg = colors.successText, bg = bg },
		hint_visible = { fg = colors.successText, bg = bg },
		hint_selected = {
			fg = colors.successText,
			bg = colors.editorBackground,
			italic = options.italics.bufferline or false,
		},
		hint_diagnostic = { fg = colors.successText, bg = bg },
		hint_diagnostic_visible = { fg = colors.successText, bg = bg },
		hint_diagnostic_selected = {
			fg = colors.successText,
			bg = colors.editorBackground,
		},

		diagnostic = { fg = colors.lineNumberTextActive, bg = bg },
		diagnostic_visible = { fg = colors.lineNumberTextActive, bg = bg },
		diagnostic_selected = {
			fg = colors.lineNumberTextActive,
			bg = colors.editorBackground,
			italic = options.italics.bufferline or false,
		},

		modified = { fg = colors.warningText, bg = bg },
		modified_selected = {
			fg = colors.warningText,
			bg = colors.editorBackground,
		},
	}
end

return M
