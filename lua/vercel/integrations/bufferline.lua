local M = {}

--- @param options Options
function M.highlights(options)
	local colors = require("vercel.colors").getColors(options.theme)

	local bg = options.transparent and "NONE" or colors.background

	return {
		fill = { bg = bg },
		background = { bg = bg },

		tab = {
			fg = colors.foreground,
			bg = bg,
		},
		tab_selected = {
			fg = colors.foreground,
			bg = bg,
		},
		tab_separator = {
			fg = bg,
			bg = bg,
		},
		tab_separator_selected = {
			fg = bg,
			bg = bg,
		},
		tab_close = {
			fg = colors.red,
			bg = bg,
		},

		close_button = {
			fg = colors.lineNumber,
			bg = bg,
		},
		close_button_visible = {
			fg = colors.secondary,
			bg = bg,
		},
		close_button_selected = {
			fg = colors.foreground,
			bg = bg,
		},

		buffer_visible = {
			fg = colors.lineNumber,
			bg = bg,
		},
		buffer_selected = {
			fg = colors.orange,
			bg = bg,
			bold = false,
		},

		numbers = {
			fg = colors.secondary,
			bg = bg,
		},
		numbers_visible = {
			fg = colors.secondary,
			bg = bg,
		},
		numbers_selected = {
			fg = colors.foreground,
			bg = bg,
			italic = options.italics.bufferline or false,
		},

		diagnostic = {
			fg = colors.secondary,
			bg = bg,
		},
		diagnostic_visible = {
			fg = colors.secondary,
			bg = bg,
		},
		diagnostic_selected = {
			fg = colors.secondary,
			bg = bg,
			italic = options.italics.bufferline or false,
		},

		hint = {
			fg = colors.green,
			bg = bg,
		},
		hint_visible = {
			fg = colors.green,
			bg = bg,
		},
		hint_selected = {
			fg = colors.green,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		hint_diagnostic = {
			fg = colors.green,
			bg = bg,
		},
		hint_diagnostic_visible = {
			fg = colors.green,
			bg = bg,
		},
		hint_diagnostic_selected = {
			fg = colors.green,
			bg = bg,
		},

		info = {
			fg = colors.blue,
			bg = bg,
		},
		info_visible = {
			fg = colors.blue,
			bg = bg,
		},
		info_selected = {
			fg = colors.blue,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		info_diagnostic = {
			fg = colors.blue,
			bg = bg,
		},
		info_diagnostic_visible = {
			fg = colors.blue,
			bg = bg,
		},
		info_diagnostic_selected = {
			fg = colors.blue,
			bg = bg,
		},

		warning = {
			fg = colors.yellow,
			bg = bg,
		},
		warning_visible = {
			fg = colors.yellow,
			bg = bg,
		},
		warning_selected = {
			fg = colors.yellow,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		warning_diagnostic = {
			fg = colors.yellow,
			bg = bg,
		},
		warning_diagnostic_visible = {
			fg = colors.yellow,
			bg = bg,
		},
		warning_diagnostic_selected = {
			fg = colors.yellow,
			bg = bg,
		},

		error = {
			fg = colors.red,
			bg = bg,
		},
		error_visible = {
			fg = colors.red,
			bg = bg,
		},
		error_selected = {
			fg = colors.red,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		error_diagnostic = {
			fg = colors.red,
			bg = bg,
		},
		error_diagnostic_visible = {
			fg = colors.red,
			bg = bg,
		},
		error_diagnostic_selected = {
			fg = colors.red,
			bg = bg,
		},

		modified = {
			fg = colors.yellow,
			bg = bg,
		},
		modified_visible = {
			fg = colors.yellow,
			bg = bg,
		},
		modified_selected = {
			fg = colors.yellow,
			bg = bg,
		},

		duplicate_selected = {
			fg = colors.foreground,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		duplicate_visible = {
			fg = colors.foreground,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		duplicate = {
			fg = colors.foreground,
			bg = bg,
			italic = options.italics.bufferline or false,
		},

		separator_selected = {
			fg = bg,
			bg = bg,
		},
		separator_visible = {
			fg = bg,
			bg = bg,
		},
		separator = {
			fg = bg,
			bg = bg,
		},

		indicator_selected = {
			fg = colors.foreground,
			bg = bg,
		},
		indicator_visible = {
			fg = colors.foreground,
			bg = bg,
		},

		pick_selected = {
			fg = colors.red,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		pick_visible = {
			fg = colors.foreground,
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		pick = {
			fg = colors.foreground,
			bg = bg,
			italic = options.italics.bufferline or false,
		},

		offset_separator = {
			fg = colors.border,
			bg = bg,
		},
		trunc_marker = {
			fg = colors.border,
			bg = bg,
		},
	}
end

return M
