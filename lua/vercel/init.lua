local colors = require("vercel.colors")
local config = require("vercel.config")
local utils = require("vercel.utils")

local M = {}

---@param options Options
function M.setup(options)
	setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, options) })

	M.highlights = { bufferline = {}, navic = {} }
	M.highlights.bufferline = require("vercel.integrations.bufferline").highlights(config)
	M.highlights.navic = require("vercel.integrations.navic").highlights(config)
end

function M.colorscheme()
	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.g.VM_theme_set_by_colorscheme = true
	vim.o.termguicolors = true
	vim.g.colors_name = "vercel"

	M.set_terminal_colors()
	M.set_groups()
end

function M.set_terminal_colors()
	vim.g.terminal_color_0 = colors.editorBackground
	vim.g.terminal_color_1 = colors.errorText
	vim.g.terminal_color_2 = colors.successText
	vim.g.terminal_color_3 = colors.warningText
	vim.g.terminal_color_4 = colors.syntaxConstant
	vim.g.terminal_color_5 = colors.syntaxFunction
	vim.g.terminal_color_6 = colors.stringText
	vim.g.terminal_color_7 = colors.mainText
	vim.g.terminal_color_8 = colors.editorBackground
	vim.g.terminal_color_9 = colors.errorText
	vim.g.terminal_color_10 = colors.successText
	vim.g.terminal_color_11 = colors.warningText
	vim.g.terminal_color_12 = colors.syntaxConstant
	vim.g.terminal_color_13 = colors.syntaxFunction
	vim.g.terminal_color_14 = colors.stringText
	vim.g.terminal_color_15 = colors.mainText
	vim.g.terminal_color_background = colors.editorBackground
	vim.g.terminal_color_foreground = colors.mainText
end

function M.set_groups()
	local bg = config.transparent and "NONE" or colors.editorBackground
	local diff_add = utils.shade(colors.successText, 0.5, colors.editorBackground)
	local diff_delete = utils.shade(colors.syntaxKeyword, 0.5, colors.editorBackground)
	local diff_change = utils.shade(colors.syntaxFunction, 0.5, colors.editorBackground)
	local diff_text = utils.shade(colors.syntaxProperty, 0.5, colors.editorBackground)

	local groups = {
		-- base
		Normal = { fg = colors.mainText, bg = bg },
		LineNrAbove = { fg = colors.lineNumberText },
		LineNr = { fg = colors.lineNumberTextActive },
		LineNrBelow = { fg = colors.lineNumberText },
		ColorColumn = {
			bg = utils.shade(colors.stringText, 0.5, colors.editorBackground),
		},
		Conceal = {},
		Cursor = { fg = colors.editorBackground, bg = colors.mainText },
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = colors.popupBackground },
		CursorColumn = { link = "CursorLine" },
		Directory = { fg = colors.mainText },
		DiffAdd = { bg = bg, fg = diff_add },
		DiffChange = { bg = bg, fg = diff_change },
		DiffDelete = { bg = bg, fg = diff_delete },
		DiffText = { bg = bg, fg = diff_text },
		EndOfBuffer = { fg = colors.syntaxConstant },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = { fg = colors.syntaxKeyword },
		VertSplit = { fg = colors.border, bg = "NONE" },
		Winseparator = { link = "VertSplit" },
		SignColumn = { link = "Normal" },
		Folded = { fg = colors.mainText, bg = colors.popupBackground },
		FoldColumn = { link = "SignColumn" },
		IncSearch = {
			bg = utils.mix(colors.syntaxConstant, colors.editorBackground, math.abs(0.30)),
			fg = colors.editorBackground,
		},
		Substitute = { link = "IncSearch" },
		CursorLineNr = { fg = colors.commentText },
		MatchParen = { fg = colors.syntaxKeyword },
		ModeMsg = { link = "Normal" },
		MsgArea = { link = "Normal" },
		-- MsgSeparator = {},
		MoreMsg = { fg = colors.syntaxConstant },
		NonText = { fg = colors.lineNumberText },
		NormalFloat = { bg = bg },
		FloatBorder = { fg = colors.border },
		NormalNC = { link = "Normal" },
		Pmenu = { link = "NormalFloat" },
		PmenuSel = { bg = colors.menuOptionBackground },
		PmenuSbar = {
			bg = utils.shade(colors.editorBackground, 0.5, colors.editorBackground),
		},
		PmenuThumb = { bg = utils.shade(colors.editorBackground, 0.20) },
		Question = { fg = colors.syntaxFunction },
		QuickFixLine = { fg = colors.syntaxFunction },
		SpecialKey = { fg = colors.syntaxProperty },
		StatusLine = { fg = colors.mainText, bg = bg },
		StatusLineNC = {
			fg = colors.inactiveText,
			bg = colors.editorBackground,
		},
		TabLine = {
			bg = colors.editorBackground,
			fg = colors.inactiveText,
		},
		TabLineFill = { link = "TabLine" },
		TabLineSel = {
			bg = colors.editorBackground,
			fg = colors.mainText,
		},
		Search = { bg = utils.shade(colors.stringText, 0.70, colors.bg) },
		SpellBad = { undercurl = true, sp = colors.syntaxKeyword },
		SpellCap = { undercurl = true, sp = colors.syntaxFunction },
		SpellLocal = { undercurl = true, sp = colors.syntaxConstant },
		SpellRare = { undercurl = true, sp = colors.warningText },
		Title = { fg = colors.syntaxConstant, bold = true },
		Visual = {
			bg = utils.shade(colors.syntaxConstant, 0.40, colors.editorBackground),
		},
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = colors.warningText },
		Whitespace = { fg = colors.editorBackground },
		WildMenu = { bg = colors.menuOptionBackground },
		Comment = {
			fg = colors.commentText,
			italic = config.italics.comments or false,
		},

		Constant = { fg = colors.syntaxConstant },
		String = {
			fg = colors.stringText,
			italic = config.italics.strings or false,
		},
		Character = { fg = colors.stringText },
		Number = { fg = colors.syntaxConstant },
		Boolean = { fg = colors.syntaxConstant },
		Float = { link = "Number" },

		Identifier = { fg = colors.mainText },
		Function = { fg = colors.syntaxFunction },
		Method = { fg = colors.syntaxConstant },
		Property = { fg = colors.syntaxKeyword },
		Field = { link = "Property" },
		Parameter = { fg = colors.syntaxConstant },
		Statement = { fg = colors.syntaxKeyword },
		Conditional = { fg = colors.syntaxKeyword },
		-- Repeat = {},
		Label = { fg = colors.syntaxFunction },
		Operator = { fg = colors.syntaxKeyword },
		Keyword = { link = "Statement", italic = config.italics.keywords or false },
		Exception = { fg = colors.syntaxKeyword },

		PreProc = { link = "Keyword" },
		-- Include = {},
		Define = { fg = colors.syntaxConstant },
		Macro = { link = "Define" },
		PreCondit = { fg = colors.syntaxKeyword },

		Type = { fg = colors.syntaxConstant },
		Struct = { link = "Type" },
		Class = { link = "Type" },

		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Attribute = { link = "Character" },
		Punctuation = { fg = colors.syntaxProperty },
		Special = { fg = colors.syntaxProperty },

		SpecialChar = { fg = colors.syntaxKeyword },
		Tag = { fg = colors.stringText },
		Delimiter = { fg = colors.syntaxProperty },
		-- SpecialComment = {},
		Debug = { fg = colors.mainText },

		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Ignore = { fg = colors.editorBackground },
		Error = { link = "ErrorMsg" },
		Todo = { fg = colors.warningText, bold = true },

		-- LspReferenceText = {},
		-- LspReferenceRead = {},
		-- LspReferenceWrite = {},
		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		-- LspSignatureActiveParameter = {},

		DiagnosticError = { link = "Error" },
		DiagnosticWarn = { link = "WarningMsg" },
		DiagnosticInfo = { fg = colors.syntaxFunction },
		DiagnosticHint = { fg = colors.syntaxConstant },
		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
		DiagnosticUnderlineError = { undercurl = true, link = "DiagnosticError" },
		DiagnosticUnderlineWarn = { undercurl = true, link = "DiagnosticWarn" },
		DiagnosticUnderlineInfo = { undercurl = true, link = "DiagnosticInfo" },
		DiagnosticUnderlineHint = { undercurl = true, link = "DiagnosticHint" },
		-- DiagnosticFloatingError = {},
		-- DiagnosticFloatingWarn = {},
		-- DiagnosticFloatingInfo = {},
		-- DiagnosticFloatingHint = {},
		-- DiagnosticSignError = {},
		-- DiagnosticSignWarn = {},
		-- DiagnosticSignInfo = {},
		-- DiagnosticSignHint = {},

		["@text"] = { fg = colors.mainText },
		["@texcolorscheme.literal"] = { link = "Property" },
		-- ["@texcolorscheme.reference"] = {},
		["@texcolorscheme.strong"] = { link = "Bold" },
		["@texcolorscheme.italic"] = { link = "Italic" },
		["@texcolorscheme.title"] = { link = "Keyword" },
		["@texcolorscheme.uri"] = {
			fg = colors.syntaxFunction,
			sp = colors.syntaxFunction,
			underline = true,
		},
		["@texcolorscheme.underline"] = { link = "Underlined" },
		["@symbol"] = { fg = colors.syntaxProperty },
		["@texcolorscheme.todo"] = { link = "Todo" },
		["@comment"] = { link = "Comment" },
		["@punctuation"] = { link = "Punctuation" },
		["@punctuation.bracket"] = { fg = colors.mainText },
		["@punctuation.delimiter"] = { fg = colors.syntaxKeyword },
		["@punctuation.terminator.statement"] = { link = "Delimiter" },
		["@punctuation.special"] = { fg = colors.syntaxKeyword },
		["@punctuation.separator.keyvalue"] = { fg = colors.syntaxKeyword },

		["@texcolorscheme.diff.add"] = { fg = colors.successText },
		["@texcolorscheme.diff.delete"] = { fg = colors.errorText },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = colors.syntaxFunction },
		["@constancolorscheme.builtin"] = { link = "Keyword" },
		-- ["@constancolorscheme.macro"] = {},
		-- ["@define"] = {},
		-- ["@macro"] = {},
		["@string"] = { link = "String" },
		["@string.escape"] = { fg = utils.shade(colors.stringText, 0.45) },
		["@string.special"] = { fg = utils.shade(colors.syntaxFunction, 0.45) },
		-- ["@character"] = {},
		-- ["@character.special"] = {},
		["@number"] = { link = "Number" },
		["@number.tsx"] = { link = "Constant" },
		["@boolean"] = { link = "Boolean" },
		-- ["@float"] = {},
		["@function"] = {
			link = "Function",
			italic = config.italics.functions or false,
		},
		["@function.call"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		-- ["@function.macro"] = {},
		["@parameter"] = { link = "Parameter" },
		["@method"] = { link = "Function" },
		["@field"] = { link = "Property" },
		["@property"] = { link = "Property" },
		["@constructor"] = { fg = colors.syntaxFunction },
		-- ["@conditional"] = {},
		-- ["@repeat"] = {},
		["@label"] = { link = "Label" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@variable"] = {
			fg = colors.mainText,
			italic = config.italics.variables or false,
		},
		["@variable.builtin"] = { fg = colors.syntaxConstant },
		["@variable.member"] = { fg = colors.mainText },
		["@variable.parameter"] = {
			fg = colors.mainText,
			italic = config.italics.variables or false,
		},
		["@type"] = { link = "Type" },
		["@type.definition"] = { fg = colors.mainText },
		["@type.builtin"] = { fg = colors.syntaxConstant },
		["@type.qualifier"] = { fg = colors.syntaxFunction },
		["@type.tsx"] = { fg = colors.mainText },
		["@keyword"] = { link = "Keyword" },
		-- ["@storageclass"] = {},
		-- ["@structure"] = {},
		["@namespace"] = { link = "Type" },
		["@annotation"] = { link = "Label" },
		-- ["@include"] = {},
		-- ["@preproc"] = {},
		["@debug"] = { fg = colors.mainText },
		["@tag"] = { link = "Tag" },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { fg = colors.syntaxProperty },
		["@tag.attribute"] = { fg = colors.syntaxFunction },
		["@tag.jsx.element"] = { fg = colors.syntaxFunction },
		["@tag.tsx"] = { fg = colors.syntaxConstant },
		["@attribute"] = { fg = colors.syntaxConstant },
		["@error"] = { link = "Error" },
		["@warning"] = { link = "WarningMsg" },
		["@info"] = { fg = colors.syntaxFunction },

		-- Specific languages
		-- overrides
		["@label.json"] = { fg = colors.syntaxProperty }, -- For json
		["@label.help"] = { link = "@texcolorscheme.uri" }, -- For help files
		["@texcolorscheme.uri.html"] = { underline = true }, -- For html
		["@markup.heading"] = { fg = colors.mainText, bold = true }, -- For markdown

		-- semantic highlighting
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@function" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { fg = colors.syntaxFunction },
		["@lsp.type.interface"] = { link = "@function" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@text" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@label" },
		["@lsp.type.decorator"] = { link = "@label" },
		["@lsp.type.variable"] = { link = "@text" },
		["@lsp.typemod.function"] = { link = "@function" },
		["@lsp.typemod.parameter.declaration"] = { link = "@text" },

		["@lsp.typemod.variable.readonly"] = { link = "@text" },
		["@lsp.typemod.variable.declaration"] = { fg = colors.syntaxConstant },

		["@lsp.typemod.variable.readonly.typescriptreact"] = { fg = colors.syntaxConstant },
		["@lsp.typemod.function.declaration.typescriptreact"] = { fg = colors.syntaxConstant },
	}

	-- integrations
	groups = vim.tbl_extend("force", groups, require("vercel.integrations.cmp").highlights())

	-- overrides
	groups = vim.tbl_extend(
		"force",
		groups,
		type(config.overrides) == "function" and config.overrides(config) or config.overrides
	)

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
