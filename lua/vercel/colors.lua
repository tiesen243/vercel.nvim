local config = require("vercel.config")

local M = {
	standardWhite = "#ffffff",
	standardBlack = "#000000",
}

if vim.o.background == "light" then
	M.editorBackground = config.transparent and "none" or "#ffffff"
	M.sidebarBackground = "#f7f7f8"
	M.popupBackground = "#ffffff"
	M.floatingWindowBackground = "#ffffff"
	M.menuOptionBackground = "#f0f0f1"

	M.mainText = "#1e1e1e"
	M.emphasisText = "#000000"
	M.commandText = "#000000"
	M.inactiveText = "#666666"
	M.disabledText = "#b3b3b3"
	M.lineNumberText = "#a1a1aa"
	M.selectedText = "#1e1e1e"
	M.inactiveSelectionText = "#999999"

	M.windowBorder = "#d4d4d8"
	M.focusedBorder = "#999999"
	M.emphasizedBorder = "#666666"

	M.syntaxFunction = "#0066cc"
	M.syntaxError = "#cc0000"
	M.syntaxKeyword = "#6e4aff"
	M.errorText = "#cc0000"
	M.warningText = "#ff8800"
	M.linkText = "#0066cc"
	M.commentText = "#666666"
	M.stringText = "#007f00"
	M.successText = "#22863a"
	M.warningEmphasis = "#cd9731"
	M.specialKeyword = "#800080"
	M.syntaxOperator = "#000000"
	M.foregroundEmphasis = "#000000"
	M.terminalGray = "#666666"
else
	M.editorBackground = config.transparent and "none" or "#000000"
	M.sidebarBackground = "#0a0a0a"
	M.popupBackground = "#1a1a1a"
	M.floatingWindowBackground = "#1a1a1a"
	M.menuOptionBackground = "#1a1a1a"

	M.mainText = "#e5e5e5"
	M.emphasisText = "#ffffff"
	M.commandText = "#ffffff"
	M.inactiveText = "#999999"
	M.disabledText = "#666666"
	M.lineNumberText = "#666666"
	M.selectedText = "#ffffff"
	M.inactiveSelectionText = "#999999"

	M.windowBorder = "#2a2a2a"
	M.focusedBorder = "#444444"
	M.emphasizedBorder = "#808080"

	M.syntaxFunction = "#66b2ff"
	M.syntaxError = "#ff6666"
	M.syntaxKeyword = "#c792ea"
	M.errorText = "#ff6666"
	M.warningText = "#ffb86c"
	M.linkText = "#82aaff"
	M.commentText = "#999999"
	M.stringText = "#a8ff60"
	M.successText = "#50fa7b"
	M.warningEmphasis = "#ffb86c"
	M.specialKeyword = "#ff79c6"
	M.syntaxOperator = "#f8f8f2"
	M.foregroundEmphasis = "#ffffff"
	M.terminalGray = "#999999"
end

return M
