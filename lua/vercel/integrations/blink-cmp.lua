local M = {}

--- @param options Options
function M.highlights(options)
	local colors = require("vercel.colors").getColors(options.theme)

	return {
		BlinkCmpMenu = { fg = colors.foreground },
		BlinkCmpMenuBorder = { fg = colors.border },
		BlinkCmpMenuSelection = { fg = colors.foreground, bg = colors.border, bold = true },
		BlinkCmpScrollBarThumb = { bg = colors.border },
		BlinkCmpScrollBarGutter = { fg = colors.border },

		BlinkCmpLabel = { fg = colors.foreground },
		BlinkCmpLabelDeprecated = { fg = colors.red, strikethrough = true },
		BlinkCmpLabelDetail = { fg = colors.secondary },
		BlinkCmpLabelDescription = { fg = colors.secondary },
		BlinkCmpSource = { fg = colors.secondary },
		BlinkCmpGhostText = { fg = colors.secondary },

		BlinkCmpDoc = { fg = colors.foreground },
		BlinkCmpDocBorder = { fg = colors.border },
		BlinkCmpDocSeparator = { fg = colors.border },

		BlinkCmpSignatureHelp = { fg = colors.foreground },
		BlinkCmpSignatureHelpBorder = { bg = colors.border },

		-- kind support
		BlinkCmpKindClass = { fg = colors.orange },
		BlinkCmpKindInterface = { fg = colors.blue },
		BlinkCmpKindStruct = { fg = colors.blue },
		BlinkCmpKindEnum = { fg = colors.purple },
		BlinkCmpKindEnumMember = { fg = colors.purple },
		BlinkCmpKindTypeParameter = { fg = colors.orange },
		BlinkCmpKindMethod = { fg = colors.purple },
		BlinkCmpKindFunction = { fg = colors.purple },
		BlinkCmpKindConstructor = { fg = colors.blue },
		BlinkCmpKindEvent = { fg = colors.orange },
		BlinkCmpKindOperator = { fg = colors.secondary },
		BlinkCmpKindField = { fg = colors.blue },
		BlinkCmpKindProperty = { fg = colors.blue },
		BlinkCmpKindVariable = { fg = colors.blue },
		BlinkCmpKindConstant = { fg = colors.blue },
		BlinkCmpKindValue = { fg = colors.blue },
		BlinkCmpKindReference = { fg = colors.red },
		BlinkCmpKindColor = { fg = colors.red },
		BlinkCmpKindModule = { fg = colors.yellow },
		BlinkCmpKindFile = { fg = colors.yellow },
		BlinkCmpKindFolder = { fg = colors.yellow },
		BlinkCmpKindSnippet = { fg = colors.purple },
		BlinkCmpKindText = { fg = colors.secondary },
		BlinkCmpKindKeyword = { fg = colors.foreground },
		BlinkCmpKindUnit = { fg = colors.yellow },
	}
end

return M
