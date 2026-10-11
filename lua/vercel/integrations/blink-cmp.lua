local M = {}

--- @param options Options
function M.highlights(options)
	local tokens = require("vercel.tokens").getTokens(options.theme)

	return {
		BlinkCmpMenu = { link = "Pmenu" },
		BlinkCmpMenuBorder = { link = "FloatBorder" },
		BlinkCmpMenuSelection = { link = "PmenuSel" },
		BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
		BlinkCmpScrollBarGutter = { link = "PmenuSbar" },

		BlinkCmpLabel = { link = "Normal" },
		BlinkCmpLabelDeprecated = { fg = tokens.red[600], strikethrough = true },
		BlinkCmpLabelDetail = { fg = tokens.gray[900] },
		BlinkCmpLabelDescription = { fg = tokens.gray[900] },
		BlinkCmpSource = { fg = tokens.gray[900] },
		BlinkCmpGhostText = { fg = tokens.gray[900] },

		BlinkCmpDoc = { link = "Normal" },
		BlinkCmpDocBorder = { link = "FloatBorder" },
		BlinkCmpDocSeparator = { link = "VertSplit" },

		BlinkCmpSignatureHelp = { link = "Normal" },
		BlinkCmpSignatureHelpBorder = { bg = tokens.gray[200] },

		-- kind support
		BlinkCmpKindClass = { fg = tokens.amber[600] },
		BlinkCmpKindInterface = { fg = tokens.blue[600] },
		BlinkCmpKindStruct = { fg = tokens.blue[600] },
		BlinkCmpKindEnum = { fg = tokens.purple[600] },
		BlinkCmpKindEnumMember = { fg = tokens.purple[600] },
		BlinkCmpKindTypeParameter = { fg = tokens.amber[600] },
		BlinkCmpKindMethod = { fg = tokens.purple[600] },
		BlinkCmpKindFunction = { fg = tokens.purple[600] },
		BlinkCmpKindConstructor = { fg = tokens.blue[600] },
		BlinkCmpKindEvent = { fg = tokens.amber[600] },
		BlinkCmpKindOperator = { fg = tokens.gray[900] },
		BlinkCmpKindField = { fg = tokens.blue[600] },
		BlinkCmpKindProperty = { fg = tokens.blue[600] },
		BlinkCmpKindVariable = { fg = tokens.blue[600] },
		BlinkCmpKindConstant = { fg = tokens.blue[600] },
		BlinkCmpKindValue = { fg = tokens.blue[600] },
		BlinkCmpKindReference = { fg = tokens.red[600] },
		BlinkCmpKindColor = { fg = tokens.red[600] },
		BlinkCmpKindModule = { fg = tokens.amber[600] },
		BlinkCmpKindFile = { fg = tokens.amber[600] },
		BlinkCmpKindFolder = { fg = tokens.amber[600] },
		BlinkCmpKindSnippet = { fg = tokens.purple[600] },
		BlinkCmpKindText = { fg = tokens.gray[900] },
		BlinkCmpKindKeyword = { fg = tokens.gray[1000] },
		BlinkCmpKindUnit = { fg = tokens.amber[600] },
	}
end

return M
