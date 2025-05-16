local colors = require("vercel.colors")
local config = require("vercel.config")
local utils = require("vercel.utils")

local M = {}

---@param options Options
function M.setup(options)
	setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, options) })

	M.highlights = { bufferline = {} }
	M.highlights.bufferline = require("vercel.integrations.bufferline").highlights(config)
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
	vim.g.terminal_color_0 = colors.background
	vim.g.terminal_color_1 = colors.error
	vim.g.terminal_color_2 = colors.green
	vim.g.terminal_color_3 = colors.yellow
	vim.g.terminal_color_4 = colors.blue
	vim.g.terminal_color_5 = colors.puple
	vim.g.terminal_color_6 = colors.string
	vim.g.terminal_color_7 = colors.foreground
	vim.g.terminal_color_8 = colors.background
	vim.g.terminal_color_9 = colors.error
	vim.g.terminal_color_10 = colors.green
	vim.g.terminal_color_11 = colors.yellow
	vim.g.terminal_color_12 = colors.blue
	vim.g.terminal_color_13 = colors.puple
	vim.g.terminal_color_14 = colors.string
	vim.g.terminal_color_15 = colors.foreground
	vim.g.terminal_color_background = colors.background
	vim.g.terminal_color_foreground = colors.foreground
end

function M.set_groups()
	local bg = config.transparent and "NONE" or colors.background
	local diff_add = utils.shade(colors.green, 0.5, colors.background)
	local diff_delete = utils.shade(colors.red, 0.5, colors.background)
	local diff_change = utils.shade(colors.puple, 0.5, colors.background)
	local diff_text = utils.shade(colors.property, 0.5, colors.background)

	local groups = {
		-- base
		Normal = { fg = colors.foreground, bg = bg },
		LineNrAbove = { fg = colors.lineNumber },
		LineNr = { fg = colors.lineNumberActive },
		LineNrBelow = { fg = colors.lineNumber },
		ColorColumn = {
			bg = utils.shade(colors.string, 0.5, colors.background),
		},
		Conceal = {},
		Cursor = { fg = colors.background, bg = colors.foreground },
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = colors.popup },
		CursorColumn = { link = "CursorLine" },
		Directory = { fg = colors.foreground },
		DiffAdd = { bg = bg, fg = diff_add },
		DiffChange = { bg = bg, fg = diff_change },
		DiffDelete = { bg = bg, fg = diff_delete },
		DiffText = { bg = bg, fg = diff_text },
		EndOfBuffer = { fg = colors.blue },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = { fg = colors.red },
		VertSplit = { fg = colors.border, bg = "NONE" },
		Winseparator = { link = "VertSplit" },
		SignColumn = { link = "Normal" },
		Folded = { fg = colors.foreground, bg = colors.popup },
		FoldColumn = { link = "SignColumn" },
		IncSearch = {
			bg = utils.mix(colors.blue, colors.background, math.abs(0.30)),
			fg = colors.background,
		},
		Substitute = { link = "IncSearch" },
		CursorLineNr = { fg = colors.comment },
		MatchParen = { fg = colors.red },
		ModeMsg = { link = "Normal" },
		MsgArea = { link = "Normal" },
		-- MsgSeparator = {},
		MoreMsg = { fg = colors.blue },
		NonText = { fg = colors.lineNumber },
		NormalFloat = { bg = bg },
		FloatBorder = { fg = colors.border },
		NormalNC = { link = "Normal" },
		Pmenu = { link = "NormalFloat" },
		PmenuSel = { bg = colors.menu },
		PmenuSbar = {
			bg = utils.shade(colors.background, 0.5, colors.background),
		},
		PmenuThumb = { bg = utils.shade(colors.background, 0.20) },
		Question = { fg = colors.puple },
		QuickFixLine = { fg = colors.puple },
		SpecialKey = { fg = colors.property },
		StatusLine = { fg = colors.foreground, bg = bg },
		StatusLineNC = {
			fg = colors.mutedForeground,
			bg = config.transparent and "NONE" or colors.popup,
		},
		TabLine = {
			fg = colors.mutedForeground,
			bg = colors.background,
		},
		TabLineFill = { link = "TabLine" },
		TabLineSel = {
			bg = colors.background,
			fg = colors.foreground,
		},
		Search = { bg = utils.shade(colors.string, 0.70, colors.bg) },
		SpellBad = { undercurl = true, sp = colors.red },
		SpellCap = { undercurl = true, sp = colors.puple },
		SpellLocal = { undercurl = true, sp = colors.blue },
		SpellRare = { undercurl = true, sp = colors.yellow },
		Title = { fg = colors.blue, bold = true },
		Visual = {
			bg = utils.shade(colors.blue, 0.40, colors.background),
		},
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = colors.yellow },
		Whitespace = { fg = colors.background },
		WildMenu = { bg = colors.menu },
		Comment = {
			fg = colors.comment,
			italic = config.italics.comments or false,
		},

		Constant = { fg = colors.blue },
		String = {
			fg = colors.string,
			italic = config.italics.strings or false,
		},
		Character = { fg = colors.string },
		Number = { fg = colors.blue },
		Boolean = { fg = colors.blue },
		Float = { link = "Number" },

		Identifier = { fg = colors.foreground },
		Function = { fg = colors.puple },
		Method = { fg = colors.blue },
		Property = { fg = colors.red },
		Field = { link = "Property" },
		Parameter = { fg = colors.orange },
		Statement = { fg = colors.red },
		Conditional = { fg = colors.red },
		-- Repeat = {},
		Label = { fg = colors.puple },
		Operator = { fg = colors.red },
		Keyword = { link = "Statement", italic = config.italics.keywords or false },
		Exception = { fg = colors.red },

		PreProc = { link = "Keyword" },
		-- Include = {},
		Define = { fg = colors.blue },
		Macro = { link = "Define" },
		PreCondit = { fg = colors.red },

		Type = { fg = colors.puple },
		Struct = { link = "Type" },
		Class = { link = "Type" },

		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Attribute = { link = "Character" },
		Punctuation = { fg = colors.property },
		Special = { fg = colors.property },

		SpecialChar = { fg = colors.red },
		Tag = { fg = colors.string },
		Delimiter = { fg = colors.property },
		-- SpecialComment = {},
		Debug = { fg = colors.foreground },

		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Ignore = { fg = colors.background },
		Error = { link = "ErrorMsg" },
		Todo = { fg = colors.yellow, bold = true },

		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		LspInlayHint = { link = "Comment" },
		-- LspReferenceRead = {},
		-- LspReferenceText = {},
		-- LspReferenceWrite = {},
		-- LspSignatureActiveParameter = {},

		DiagnosticError = { link = "Error" },
		DiagnosticWarn = { link = "WarningMsg" },
		DiagnosticInfo = { fg = colors.puple },
		DiagnosticHint = { fg = colors.blue },
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

		["@text"] = { fg = colors.foreground },
		["@texcolorscheme.literal"] = { link = "Property" },
		-- ["@texcolorscheme.reference"] = {},
		["@texcolorscheme.strong"] = { link = "Bold" },
		["@texcolorscheme.italic"] = { link = "Italic" },
		["@texcolorscheme.title"] = { link = "Keyword" },
		["@texcolorscheme.uri"] = {
			fg = colors.puple,
			sp = colors.puple,
			underline = true,
		},
		["@texcolorscheme.underline"] = { link = "Underlined" },
		["@symbol"] = { fg = colors.property },
		["@texcolorscheme.todo"] = { link = "Todo" },
		["@comment"] = { link = "Comment" },
		["@punctuation"] = { link = "Punctuation" },
		["@punctuation.bracket"] = { fg = colors.foreground },
		["@punctuation.delimiter"] = { fg = colors.foreground },
		["@punctuation.terminator.statement"] = { link = "Delimiter" },
		["@punctuation.special"] = { fg = colors.red },
		["@punctuation.separator.keyvalue"] = { fg = colors.red },

		["@texcolorscheme.diff.add"] = { fg = colors.green },
		["@texcolorscheme.diff.delete"] = { fg = colors.error },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@constancolorscheme.builtin"] = { link = "Keyword" },
		-- ["@constancolorscheme.macro"] = {},
		-- ["@define"] = {},
		-- ["@macro"] = {},
		["@string"] = { link = "String" },
		["@string.escape"] = { fg = utils.shade(colors.string, 0.45) },
		["@string.special"] = { fg = utils.shade(colors.puple, 0.45) },
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
		["@constructor"] = { fg = colors.puple },
		-- ["@conditional"] = {},
		-- ["@repeat"] = {},
		["@label"] = { link = "Label" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@variable"] = {
			fg = colors.foreground,
			italic = config.italics.variables or false,
		},
		["@variable.builtin"] = { fg = colors.blue },
		["@variable.member"] = { fg = colors.foreground },
		["@variable.parameter"] = {
			fg = colors.foreground,
			italic = config.italics.variables or false,
		},
		["@type"] = { link = "Type" },
		["@type.definition"] = { fg = colors.foreground },
		["@type.builtin"] = { fg = colors.blue },
		["@type.qualifier"] = { fg = colors.puple },
		["@type.tsx"] = { fg = colors.foreground },
		["@module.tsx"] = { fg = colors.foreground },
		["@keyword"] = { link = "Keyword" },
		-- ["@storageclass"] = {},
		-- ["@structure"] = {},
		["@namespace"] = { link = "Type" },
		["@annotation"] = { link = "Label" },
		-- ["@include"] = {},
		-- ["@preproc"] = {},
		["@debug"] = { fg = colors.foreground },
		["@tag"] = { link = "Tag" },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { fg = colors.property },
		["@tag.attribute"] = { fg = colors.puple },
		["@tag.jsx.element"] = { fg = colors.puple },
		["@tag.tsx"] = { fg = colors.blue },
		["@attribute"] = { fg = colors.blue },
		["@error"] = { link = "Error" },
		["@warning"] = { link = "WarningMsg" },
		["@info"] = { fg = colors.puple },

		-- Specific languages
		-- overrides
		["@label.json"] = { fg = colors.property }, -- For json
		["@label.help"] = { link = "@texcolorscheme.uri" }, -- For help files
		["@texcolorscheme.uri.html"] = { underline = true }, -- For html
		["@markup.heading"] = { fg = colors.foreground, bold = true }, -- For markdown

		-- semantic highlighting
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@function" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { fg = colors.puple },
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
		["@type.typescript"] = { fg = colors.foreground },
		["@lsp.type.variable.typescript"] = { fg = colors.blue },
		["@lsp.type.property.typescript"] = { fg = colors.foreground },
		["@lsp.type.typeParameter.typescript"] = { fg = colors.puple },
		["@lsp.mod.local.typescript"] = { fg = colors.foreground },
		["@lsp.typemod.property.declaration.typescript"] = { fg = colors.foreground },
		["@lsp.typemod.variable.declaration.typescript"] = { fg = colors.blue },
		["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = colors.foreground },
		["@lsp.typemod.function.declaration.typescript"] = { fg = colors.puple },

		["@lsp.mod.declaration.typescriptreact"] = { fg = colors.puple },
		["@lsp.typemod.variable.local.typescriptreact"] = { fg = colors.foreground },
		["@lsp.typemod.variable.declaration.typescriptreact"] = { fg = colors.blue },
		["@lsp.typemod.function.declaration.typescriptreact"] = { fg = colors.blue },
		["@lsp.typemod.property.declaration.typescriptreact"] = { fg = colors.foreground },
		["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = { fg = colors.blue },

		["@lsp.type.parameter.typescript"] = { fg = colors.foreground },
		["@lsp.type.parameter.typescriptreact"] = { fg = colors.foreground },
		["@lsp.typemod.parameter.declaration.typescript"] = { fg = colors.orange },
		["@lsp.typemod.parameter.declaration.typescriptreact"] = { fg = colors.orange },
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
