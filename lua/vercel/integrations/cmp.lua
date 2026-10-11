local M = {}

--- @param options Options
function M.highlights(options)
	local tokens = require("vercel.tokens").getTokens(options.theme)

	return {
		CmpItemMenu = { link = "Pmenu" },
		CmpItemAbbr = { link = "Pmenu" },
		CmpItemAbbrDeprecated = { fg = tokens.red[600], strikethrough = true },
		CmpItemAbbrMatch = { link = "PmenuSel", bold = true },
		CmpItemAbbrMatchFuzzy = { link = "PmenuSel", bold = true },

		-- kind support
		CmpItemKindClass = { fg = tokens.amber[600] },
		CmpItemKindInterface = { fg = tokens.blue[600] },
		CmpItemKindStruct = { fg = tokens.blue[600] },
		CmpItemKindEnum = { fg = tokens.purple[600] },
		CmpItemKindEnumMember = { fg = tokens.purple[600] },
		CmpItemKindTypeParameter = { fg = tokens.amber[600] },
		CmpItemKindMethod = { fg = tokens.purple[600] },
		CmpItemKindFunction = { fg = tokens.purple[600] },
		CmpItemKindConstructor = { fg = tokens.blue[600] },
		CmpItemKindEvent = { fg = tokens.amber[600] },
		CmpItemKindOperator = { fg = tokens.gray[900] },
		CmpItemKindField = { fg = tokens.blue[600] },
		CmpItemKindProperty = { fg = tokens.blue[600] },
		CmpItemKindVariable = { fg = tokens.blue[600] },
		CmpItemKindConstant = { fg = tokens.blue[600] },
		CmpItemKindValue = { fg = tokens.blue[600] },
		CmpItemKindReference = { fg = tokens.red[600] },
		CmpItemKindColor = { fg = tokens.red[600] },
		CmpItemKindModule = { fg = tokens.amber[600] },
		CmpItemKindFile = { fg = tokens.amber[600] },
		CmpItemKindFolder = { fg = tokens.amber[600] },
		CmpItemKindSnippet = { fg = tokens.purple[600] },
		CmpItemKindText = { fg = tokens.gray[900] },
		CmpItemKindKeyword = { fg = tokens.gray[1000] },
		CmpItemKindUnit = { fg = tokens.amber[600] },
	}
end

return M
