local M = {}

--- @param options Options
function M.highlights(options)
	local tokens = require("vercel.tokens").getTokens(options.theme)
	local bg = options.transparent and "NONE" or tokens.background[100]

	return {
		fill = { bg = bg },
		background = { bg = bg },

		tab = {
			fg = tokens.gray[1000],
			bg = bg,
		},
		tab_selected = {
			fg = tokens.gray[1000],
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
			fg = tokens.red[600],
			bg = bg,
		},

		close_button = {
			fg = tokens.gray[600],
			bg = bg,
		},
		close_button_visible = {
			fg = tokens.gray[900],
			bg = bg,
		},
		close_button_selected = {
			fg = tokens.gray[1000],
			bg = bg,
		},

		buffer_visible = {
			fg = tokens.gray[900],
			bg = bg,
		},
		buffer_selected = {
			fg = tokens.amber[600],
			bg = bg,
			bold = false,
		},

		numbers = {
			fg = tokens.gray[900],
			bg = bg,
		},
		numbers_visible = {
			fg = tokens.gray[900],
			bg = bg,
		},
		numbers_selected = {
			fg = tokens.gray[1000],
			bg = bg,
			italic = options.italics.bufferline or false,
		},

		diagnostic = {
			fg = tokens.gray[900],
			bg = bg,
		},
		diagnostic_visible = {
			fg = tokens.gray[900],
			bg = bg,
		},
		diagnostic_selected = {
			fg = tokens.gray[900],
			bg = bg,
			italic = options.italics.bufferline or false,
		},

		hint = {
			fg = tokens.green[600],
			bg = bg,
		},
		hint_visible = {
			fg = tokens.green[600],
			bg = bg,
		},
		hint_selected = {
			fg = tokens.green[600],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		hint_diagnostic = {
			fg = tokens.green[600],
			bg = bg,
		},
		hint_diagnostic_visible = {
			fg = tokens.green[600],
			bg = bg,
		},
		hint_diagnostic_selected = {
			fg = tokens.green[600],
			bg = bg,
		},

		info = {
			fg = tokens.blue[600],
			bg = bg,
		},
		info_visible = {
			fg = tokens.blue[600],
			bg = bg,
		},
		info_selected = {
			fg = tokens.blue[600],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		info_diagnostic = {
			fg = tokens.blue[600],
			bg = bg,
		},
		info_diagnostic_visible = {
			fg = tokens.blue[600],
			bg = bg,
		},
		info_diagnostic_selected = {
			fg = tokens.blue[600],
			bg = bg,
		},

		warning = {
			fg = tokens.amber[600],
			bg = bg,
		},
		warning_visible = {
			fg = tokens.amber[600],
			bg = bg,
		},
		warning_selected = {
			fg = tokens.amber[600],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		warning_diagnostic = {
			fg = tokens.amber[600],
			bg = bg,
		},
		warning_diagnostic_visible = {
			fg = tokens.amber[600],
			bg = bg,
		},
		warning_diagnostic_selected = {
			fg = tokens.amber[600],
			bg = bg,
		},

		error = {
			fg = tokens.red[600],
			bg = bg,
		},
		error_visible = {
			fg = tokens.red[600],
			bg = bg,
		},
		error_selected = {
			fg = tokens.red[600],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		error_diagnostic = {
			fg = tokens.red[600],
			bg = bg,
		},
		error_diagnostic_visible = {
			fg = tokens.red[600],
			bg = bg,
		},
		error_diagnostic_selected = {
			fg = tokens.red[600],
			bg = bg,
		},

		modified = {
			fg = tokens.amber[600],
			bg = bg,
		},
		modified_visible = {
			fg = tokens.amber[600],
			bg = bg,
		},
		modified_selected = {
			fg = tokens.amber[600],
			bg = bg,
		},

		duplicate_selected = {
			fg = tokens.gray[1000],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		duplicate_visible = {
			fg = tokens.gray[1000],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		duplicate = {
			fg = tokens.gray[1000],
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
			fg = tokens.gray[1000],
			bg = bg,
		},
		indicator_visible = {
			fg = tokens.gray[1000],
			bg = bg,
		},

		pick_selected = {
			fg = tokens.red[600],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		pick_visible = {
			fg = tokens.gray[1000],
			bg = bg,
			italic = options.italics.bufferline or false,
		},
		pick = {
			fg = tokens.gray[1000],
			bg = bg,
			italic = options.italics.bufferline or false,
		},

		offset_separator = {
			fg = tokens.gray[200],
			bg = bg,
		},
		trunc_marker = {
			fg = tokens.gray[200],
			bg = bg,
		},
	}
end

return M
