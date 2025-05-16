local M = {}

M.colors = require("vercel.colors").getColors("light")
M.config = require("vercel.config")
M.utils = require("vercel.utils")

---@param options Options
function M.setup(options)
	setmetatable(M.config, { __index = vim.tbl_extend("force", M.config.defaults, options) })

	M.colors = require("vercel.colors").getColors(M.config.theme)

	M.highlights = { bufferline = {} }
	M.highlights.bufferline = require("vercel.integrations.bufferline").highlights(M.config)
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
	vim.g.terminal_color_0 = M.colors.background
	vim.g.terminal_color_1 = M.colors.red
	vim.g.terminal_color_2 = M.colors.green
	vim.g.terminal_color_3 = M.colors.yellow
	vim.g.terminal_color_4 = M.colors.blue
	vim.g.terminal_color_5 = M.colors.puple
	vim.g.terminal_color_6 = M.colors.string
	vim.g.terminal_color_7 = M.colors.foreground
	vim.g.terminal_color_8 = M.colors.background
	vim.g.terminal_color_9 = M.colors.red
	vim.g.terminal_color_10 = M.colors.green
	vim.g.terminal_color_11 = M.colors.yellow
	vim.g.terminal_color_12 = M.colors.blue
	vim.g.terminal_color_13 = M.colors.puple
	vim.g.terminal_color_14 = M.colors.string
	vim.g.terminal_color_15 = M.colors.foreground
	vim.g.terminal_color_background = M.colors.background
	vim.g.terminal_color_foreground = M.colors.foreground
end

function M.set_groups()
	local bg = M.config.transparent and "NONE" or M.colors.background
	local diff_add = M.utils.shade(M.colors.green, 0.5, M.colors.background)
	local diff_delete = M.utils.shade(M.colors.red, 0.5, M.colors.background)
	local diff_change = M.utils.shade(M.colors.puple, 0.5, M.colors.background)
	local diff_text = M.utils.shade(M.colors.property, 0.5, M.colors.background)

	local groups = {
		-- base
		Normal = { fg = M.colors.foreground, bg = bg },
		LineNrAbove = { fg = M.colors.lineNumber },
		LineNr = { fg = M.colors.lineNumberActive },
		LineNrBelow = { fg = M.colors.lineNumber },
		ColorColumn = {
			bg = M.utils.shade(M.colors.string, 0.5, M.colors.background),
		},
		Conceal = {},
		Cursor = { fg = M.colors.background, bg = M.colors.foreground },
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = M.colors.popup },
		CursorColumn = { link = "CursorLine" },
		Directory = { fg = M.colors.foreground },
		DiffAdd = { bg = bg, fg = diff_add },
		DiffChange = { bg = bg, fg = diff_change },
		DiffDelete = { bg = bg, fg = diff_delete },
		DiffText = { bg = bg, fg = diff_text },
		EndOfBuffer = { fg = M.colors.blue },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = { fg = M.colors.red },
		VertSplit = { fg = M.colors.border, bg = "NONE" },
		Winseparator = { link = "VertSplit" },
		SignColumn = { link = "Normal" },
		Folded = { fg = M.colors.foreground, bg = M.colors.popup },
		FoldColumn = { link = "SignColumn" },
		IncSearch = {
			bg = M.utils.mix(M.colors.blue, M.colors.background, math.abs(0.30)),
			fg = M.colors.background,
		},
		Substitute = { link = "IncSearch" },
		CursorLineNr = { fg = M.colors.mutedForeground },
		MatchParen = { fg = M.colors.red },
		ModeMsg = { link = "Normal" },
		MsgArea = { link = "Normal" },
		-- MsgSeparator = {},
		MoreMsg = { fg = M.colors.blue },
		NonText = { fg = M.colors.lineNumber },
		NormalFloat = { bg = bg },
		FloatBorder = { fg = M.colors.border },
		NormalNC = { link = "Normal" },
		Pmenu = { link = "NormalFloat" },
		PmenuSel = { bg = M.colors.menu },
		PmenuSbar = {
			bg = M.utils.shade(M.colors.background, 0.5, M.colors.background),
		},
		PmenuThumb = { bg = M.utils.shade(M.colors.background, 0.20) },
		Question = { fg = M.colors.puple },
		QuickFixLine = { fg = M.colors.puple },
		SpecialKey = { fg = M.colors.property },
		StatusLine = { fg = M.colors.foreground, bg = bg },
		StatusLineNC = {
			fg = M.colors.mutedForeground,
			bg = M.config.transparent and "NONE" or M.colors.popup,
		},
		TabLine = {
			fg = M.colors.mutedForeground,
			bg = M.config.transparent and "NONE" or M.colors.popup,
		},
		TabLineFill = { link = "TabLine" },
		TabLineSel = {
			bg = M.colors.background,
			fg = M.colors.foreground,
		},
		Search = { bg = M.utils.shade(M.colors.string, 0.70, M.colors.bg) },
		SpellBad = { undercurl = true, sp = M.colors.red },
		SpellCap = { undercurl = true, sp = M.colors.puple },
		SpellLocal = { undercurl = true, sp = M.colors.blue },
		SpellRare = { undercurl = true, sp = M.colors.yellow },
		Title = { fg = M.colors.blue, bold = true },
		Visual = {
			bg = M.utils.shade(M.colors.blue, 0.40, M.colors.background),
		},
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = M.colors.yellow },
		Whitespace = { fg = M.colors.background },
		WildMenu = { bg = M.colors.menu },
		Comment = {
			fg = M.colors.mutedForeground,
			italic = M.config.italics.comments or false,
		},

		Constant = { fg = M.colors.blue },
		String = {
			fg = M.colors.string,
			italic = M.config.italics.strings or false,
		},
		Character = { fg = M.colors.string },
		Number = { fg = M.colors.blue },
		Boolean = { fg = M.colors.blue },
		Float = { link = "Number" },

		Identifier = { fg = M.colors.foreground },
		Function = { fg = M.colors.puple },
		Method = { fg = M.colors.blue },
		Property = { fg = M.colors.red },
		Field = { link = "Property" },
		Parameter = { fg = M.colors.orange },
		Statement = { fg = M.colors.red },
		Conditional = { fg = M.colors.red },
		-- Repeat = {},
		Label = { fg = M.colors.puple },
		Operator = { fg = M.colors.red },
		Keyword = { link = "Statement", italic = M.config.italics.keywords or false },
		Exception = { fg = M.colors.red },

		PreProc = { link = "Keyword" },
		-- Include = {},
		Define = { fg = M.colors.blue },
		Macro = { link = "Define" },
		PreCondit = { fg = M.colors.red },

		Type = { fg = M.colors.puple },
		Struct = { link = "Type" },
		Class = { link = "Type" },

		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Attribute = { link = "Character" },
		Punctuation = { fg = M.colors.property },
		Special = { fg = M.colors.property },

		SpecialChar = { fg = M.colors.red },
		Tag = { fg = M.colors.string },
		Delimiter = { fg = M.colors.property },
		-- SpecialComment = {},
		Debug = { fg = M.colors.foreground },

		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Ignore = { fg = M.colors.background },
		Error = { link = "ErrorMsg" },
		Todo = { fg = M.colors.yellow, bold = true },

		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		LspInlayHint = { link = "Comment" },
		-- LspReferenceRead = {},
		-- LspReferenceText = {},
		-- LspReferenceWrite = {},
		-- LspSignatureActiveParameter = {},

		DiagnosticError = { link = "Error" },
		DiagnosticWarn = { link = "WarningMsg" },
		DiagnosticInfo = { fg = M.colors.puple },
		DiagnosticHint = { fg = M.colors.blue },
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

		["@text"] = { fg = M.colors.foreground },
		["@texcolorscheme.literal"] = { link = "Property" },
		-- ["@texcolorscheme.reference"] = {},
		["@texcolorscheme.strong"] = { link = "Bold" },
		["@texcolorscheme.italic"] = { link = "Italic" },
		["@texcolorscheme.title"] = { link = "Keyword" },
		["@texcolorscheme.uri"] = {
			fg = M.colors.puple,
			sp = M.colors.puple,
			underline = true,
		},
		["@texcolorscheme.underline"] = { link = "Underlined" },
		["@symbol"] = { fg = M.colors.property },
		["@texcolorscheme.todo"] = { link = "Todo" },
		["@comment"] = { link = "Comment" },
		["@punctuation"] = { link = "Punctuation" },
		["@punctuation.bracket"] = { fg = M.colors.foreground },
		["@punctuation.delimiter"] = { fg = M.colors.foreground },
		["@punctuation.terminator.statement"] = { link = "Delimiter" },
		["@punctuation.special"] = { fg = M.colors.red },
		["@punctuation.separator.keyvalue"] = { fg = M.colors.red },

		["@texcolorscheme.diff.add"] = { fg = M.colors.green },
		["@texcolorscheme.diff.delete"] = { fg = M.colors.red },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@constancolorscheme.builtin"] = { link = "Keyword" },
		-- ["@constancolorscheme.macro"] = {},
		-- ["@define"] = {},
		-- ["@macro"] = {},
		["@string"] = { link = "String" },
		["@string.escape"] = { fg = M.utils.shade(M.colors.string, 0.45) },
		["@string.special"] = { fg = M.utils.shade(M.colors.puple, 0.45) },
		-- ["@character"] = {},
		-- ["@character.special"] = {},
		["@number"] = { link = "Number" },
		["@number.tsx"] = { link = "Constant" },
		["@boolean"] = { link = "Boolean" },
		-- ["@float"] = {},
		["@function"] = {
			link = "Function",
			italic = M.config.italics.functions or false,
		},
		["@function.call"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		-- ["@function.macro"] = {},
		["@parameter"] = { link = "Parameter" },
		["@method"] = { link = "Function" },
		["@field"] = { link = "Property" },
		["@property"] = { link = "Property" },
		["@constructor"] = { fg = M.colors.puple },
		-- ["@conditional"] = {},
		-- ["@repeat"] = {},
		["@label"] = { link = "Label" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@variable"] = {
			fg = M.colors.foreground,
			italic = M.config.italics.variables or false,
		},
		["@variable.builtin"] = { fg = M.colors.blue },
		["@variable.member"] = { fg = M.colors.foreground },
		["@variable.parameter"] = {
			fg = M.colors.foreground,
			italic = M.config.italics.variables or false,
		},
		["@type"] = { link = "Type" },
		["@type.definition"] = { fg = M.colors.foreground },
		["@type.builtin"] = { fg = M.colors.blue },
		["@type.qualifier"] = { fg = M.colors.puple },
		["@type.tsx"] = { fg = M.colors.foreground },
		["@module.tsx"] = { fg = M.colors.foreground },
		["@keyword"] = { link = "Keyword" },
		-- ["@storageclass"] = {},
		-- ["@structure"] = {},
		["@namespace"] = { link = "Type" },
		["@annotation"] = { link = "Label" },
		-- ["@include"] = {},
		-- ["@preproc"] = {},
		["@debug"] = { fg = M.colors.foreground },
		["@tag"] = { link = "Tag" },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { fg = M.colors.property },
		["@tag.attribute"] = { fg = M.colors.puple },
		["@tag.jsx.element"] = { fg = M.colors.puple },
		["@tag.tsx"] = { fg = M.colors.blue },
		["@attribute"] = { fg = M.colors.blue },
		["@error"] = { link = "Error" },
		["@warning"] = { link = "WarningMsg" },
		["@info"] = { fg = M.colors.puple },

		-- Specific languages
		-- overrides
		["@label.json"] = { fg = M.colors.property }, -- For json
		["@label.help"] = { link = "@texcolorscheme.uri" }, -- For help files
		["@texcolorscheme.uri.html"] = { underline = true }, -- For html
		["@markup.heading"] = { fg = M.colors.foreground, bold = true }, -- For markdown

		-- semantic highlighting
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@function" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { fg = M.colors.puple },
		["@lsp.type.interface"] = { link = "@function" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@text" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@label" },
		["@lsp.type.decorator"] = { link = "@label" },
		["@lsp.type.variable"] = { link = "@text" },

		-- specific typescriptreact highlights
		["@type.typescript"] = { fg = M.colors.foreground },
		["@lsp.type.variable.typescript"] = { fg = M.colors.blue },
		["@lsp.type.property.typescript"] = { fg = M.colors.foreground },
		["@lsp.type.typeParameter.typescript"] = { fg = M.colors.puple },
		["@lsp.mod.local.typescript"] = { fg = M.colors.foreground },
		["@lsp.typemod.property.declaration.typescript"] = { fg = M.colors.foreground },
		["@lsp.typemod.variable.declaration.typescript"] = { fg = M.colors.blue },
		["@lsp.typemod.function.declaration.typescript"] = { fg = M.colors.puple },
		["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = M.colors.foreground },

		["@lsp.mod.declaration.typescriptreact"] = { fg = M.colors.puple },
		["@lsp.typemod.variable.local.typescriptreact"] = { fg = M.colors.foreground },
		["@lsp.typemod.variable.declaration.typescriptreact"] = { fg = M.colors.blue },
		["@lsp.typemod.function.declaration.typescriptreact"] = { fg = M.colors.blue },
		["@lsp.typemod.property.declaration.typescriptreact"] = { fg = M.colors.foreground },
		["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = { fg = M.colors.blue },

		["@lsp.type.parameter.typescript"] = { fg = M.colors.foreground },
		["@lsp.type.parameter.typescriptreact"] = { fg = M.colors.foreground },
		["@lsp.typemod.parameter.declaration.typescript"] = { fg = M.colors.orange },
		["@lsp.typemod.parameter.declaration.typescriptreact"] = { fg = M.colors.orange },
	}

	-- integrations
	-- groups = vim.tbl_extend("force", groups, require("vercel.integrations.{pack}").highlights())

	-- overrides
	groups = vim.tbl_extend(
		"force",
		groups,
		type(M.config.overrides) == "function" and M.config.overrides(M.config) or M.config.overrides
	)

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
