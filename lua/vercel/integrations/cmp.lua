local M = {}

--- @param options Options
function M.highlights(options)
	local colors = require("vercel.colors").getColors(options.theme)

	return {
		CmpItemMenu = { fg = colors.foreground },
		CmpItemAbbr = { fg = colors.foreground },
		CmpItemAbbrDeprecated = { fg = colors.red, strikethrough = true },
		CmpItemAbbrMatch = { fg = colors.foreground, bg = colors.border, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = colors.foreground, bg = colors.border, bold = true },

		-- kind support
		CmpItemKindClass = { fg = colors.orange },
		CmpItemKindInterface = { fg = colors.blue },
		CmpItemKindStruct = { fg = colors.blue },
		CmpItemKindEnum = { fg = colors.purple },
		CmpItemKindEnumMember = { fg = colors.purple },
		CmpItemKindTypeParameter = { fg = colors.orange },
		CmpItemKindMethod = { fg = colors.purple },
		CmpItemKindFunction = { fg = colors.purple },
		CmpItemKindConstructor = { fg = colors.blue },
		CmpItemKindEvent = { fg = colors.orange },
		CmpItemKindOperator = { fg = colors.secondary },
		CmpItemKindField = { fg = colors.blue },
		CmpItemKindProperty = { fg = colors.blue },
		CmpItemKindVariable = { fg = colors.blue },
		CmpItemKindConstant = { fg = colors.blue },
		CmpItemKindValue = { fg = colors.blue },
		CmpItemKindReference = { fg = colors.red },
		CmpItemKindColor = { fg = colors.red },
		CmpItemKindModule = { fg = colors.yellow },
		CmpItemKindFile = { fg = colors.yellow },
		CmpItemKindFolder = { fg = colors.yellow },
		CmpItemKindSnippet = { fg = colors.purple },
		CmpItemKindText = { fg = colors.secondary },
		CmpItemKindKeyword = { fg = colors.foreground },
		CmpItemKindUnit = { fg = colors.yellow },
	}
end

return M
