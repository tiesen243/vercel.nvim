local config = require("vercel.config")

local M = {
	standardWhite = "#ffffff",
	standardBlack = "#000000",
}

if vim.o.background == "light" then
	M.editorBackground = "#ffffff"
	M.sidebarBackground = "#ffffff"
	M.popupBackground = "#ffffff"
	M.floatingWindowBackground = "#ffffff"
	M.menuOptionBackground = "#ffffff"

	M.mainText = "#171717"
	M.emphasisText = "#171717"
	M.commandText = "#000000"
	M.inactiveText = "#666666"
	M.disabledText = "#b3b3b3"
	M.lineNumberText = "#bdbdbd"
	M.selectedText = "#d8d8d8"
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
	M.editorBackground = "#000000"
	M.sidebarBackground = "#000000"
	M.popupBackground = "#000000"
	M.floatingWindowBackground = "#000000"
	M.menuOptionBackground = "#000000"

	M.mainText = "#ededed"
	M.emphasisText = "#ffffff"
	M.commandText = "#ffffff"
	M.inactiveText = "#999999"
	M.disabledText = "#666666"
	M.lineNumberText = "#2b2b2b"
	M.selectedText = "#ededed"
	M.inactiveSelectionText = "#ededed"

	M.windowBorder = "#212121"
	M.focusedBorder = "#212121"
	M.emphasizedBorder = "#212121"

	M.syntaxFunction = "#c372fc"
	M.syntaxError = "#d14d41"
	M.syntaxKeyword = "#ff4c8d"
	M.errorText = "#d13d41"
	M.warningText = "#f27f35"
	M.linkText = "#00ca51"
	M.commentText = "#a3a3a3"
	M.stringText = "#00ca51"
	M.successText = "#50fa7b"
	M.warningEmphasis = "#ffb86c"
	M.specialKeyword = "#ff79c6"
	M.syntaxOperator = "#f8f8f2"
	M.foregroundEmphasis = "#ffffff"
	M.terminalGray = "#999999"
end

return M
