local colors = require("vercel.colors")

local M = {}

--- Completion menu highlights
function M.highlights()
	return {
		CmpItemAbbr = { fg = colors.mainText },
		CmpItemAbbrDeprecated = { fg = colors.mainText, strikethrough = true },
		CmpItemKind = { fg = colors.syntaxFunction },
		CmpItemMenu = { fg = colors.mainText },
		CmpItemAbbrMatch = { fg = colors.successText, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = colors.successText, bold = true },

		-- kind support
		CmpItemKindSnippet = { fg = colors.stringText },
		CmpItemKindKeyword = { fg = colors.syntaxError },
		CmpItemKindText = { fg = colors.warningText },
		CmpItemKindMethod = { fg = colors.syntaxKeyword },
		CmpItemKindConstructor = { fg = colors.syntaxKeyword },
		CmpItemKindFunction = { fg = colors.syntaxKeyword },
		CmpItemKindFolder = { fg = colors.syntaxKeyword },
		CmpItemKindModule = { fg = colors.syntaxKeyword },
		CmpItemKindConstant = { fg = colors.syntaxKeyword },
		CmpItemKindField = { fg = colors.syntaxKeyword },
		CmpItemKindProperty = { fg = colors.successText },
		CmpItemKindEnum = { fg = colors.successText },
		CmpItemKindUnit = { fg = colors.successText },
		CmpItemKindClass = { fg = colors.warningText },
		CmpItemKindVariable = { fg = colors.syntaxError },
		CmpItemKindFile = { fg = colors.linkText },
		CmpItemKindInterface = { fg = colors.stringText },
		CmpItemKindColor = { fg = colors.syntaxError },
		CmpItemKindReference = { fg = colors.syntaxError },
		CmpItemKindEnumMember = { fg = colors.syntaxError },
		CmpItemKindStruct = { fg = colors.syntaxFunction },
		CmpItemKindValue = { fg = colors.warningText },
		CmpItemKindEvent = { fg = colors.syntaxFunction },
		CmpItemKindOperator = { fg = colors.syntaxError },
		CmpItemKindTypeParameter = { fg = colors.syntaxError },
		CmpItemKindCopilot = { fg = colors.linkText },
	}
end

return M
