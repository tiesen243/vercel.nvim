local M = {}

M.tokens = require("vercel.tokens").getTokens("light")
M.config = require("vercel.config")
M.utils = require("vercel.utils")

---@param options table|nil Options
function M.setup(options)
	options = options or {}

	if options.theme == nil then
		options.theme = vim.opt.background:get()
	end

	setmetatable(M.config, { __index = vim.tbl_extend("force", M.config.defaults, options) })

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

	M.tokens = require("vercel.tokens").getTokens(M.config.theme or vim.opt.background:get())

	M.set_terminal_colors()
	M.set_groups()
end

function M.set_terminal_colors()
	-- Normal Colors (0-7)
	vim.g.terminal_color_0 = M.tokens.background[100] -- Black / Dark Gray
	vim.g.terminal_color_1 = M.tokens.red[600] -- Red
	vim.g.terminal_color_2 = M.tokens.green[600] -- Green
	vim.g.terminal_color_3 = M.tokens.amber[600] -- Yellow / Amber
	vim.g.terminal_color_4 = M.tokens.blue[600] -- Blue
	vim.g.terminal_color_5 = M.tokens.purple[600] -- Magenta / Purple
	vim.g.terminal_color_6 = M.tokens.teal[600] -- Cyan / Teal
	vim.g.terminal_color_7 = M.tokens.gray[900] -- White / Light Gray

	-- Bright Colors (8-15)
	vim.g.terminal_color_8 = M.tokens.gray[100] -- Bright Black / Gray
	vim.g.terminal_color_9 = M.tokens.red[900] -- Bright Red
	vim.g.terminal_color_10 = M.tokens.green[900] -- Bright Green
	vim.g.terminal_color_11 = M.tokens.amber[900] -- Bright Yellow
	vim.g.terminal_color_12 = M.tokens.blue[900] -- Bright Blue
	vim.g.terminal_color_13 = M.tokens.purple[900] -- Bright Magenta
	vim.g.terminal_color_14 = M.tokens.teal[900] -- Bright Cyan
	vim.g.terminal_color_15 = M.tokens.gray[1000] -- Bright White / Foreground

	-- Default Background & Foreground
	vim.g.terminal_color_background = M.tokens.background[100]
	vim.g.terminal_color_foreground = M.tokens.gray[1000]
end

function M.set_groups()
	local bg = M.config.transparent and "NONE" or M.tokens.background[100]
	local fg = M.tokens.gray[1000]
	local comment = M.tokens.gray[900]

	local diff_add = M.utils.shade(M.tokens.green[600], 0.5, M.tokens.background[200])
	local diff_delete = M.utils.shade(M.tokens.red[600], 0.5, M.tokens.background[200])
	local diff_change = M.utils.shade(M.tokens.purple[600], 0.5, M.tokens.background[200])
	local diff_text = M.utils.shade(M.tokens.gray[1000], 0.5, M.tokens.background[200])

	local groups = {
		-- base
		Normal = { fg = fg, bg = bg },
		NormalNC = { link = "Normal" },
		NormalFloat = { link = "Normal" },
		FloatBorder = { fg = M.tokens.gray[200] },
		Visual = {
			bg = M.utils.shade(M.tokens.blue[600], 0.4, M.tokens.background[100]),
		},
		VisualNOS = { link = "Visual" },

		Conceal = { fg = M.tokens.gray[600] },
		EndOfBuffer = { fg = M.tokens.background[100], bg = "NONE" },

		Title = { fg = M.tokens.blue[600], bold = true },
		NonText = { fg = comment },

		CursorLine = { bg = M.tokens.gray[100] },
		ColorColumn = { link = "CursorLine" },
		CursorColumn = { link = "CursorLine" },

		LineNrAbove = { fg = M.tokens.gray[600] },
		LineNr = { fg = fg },
		LineNrBelow = { fg = M.tokens.gray[600] },
		CursorLineNr = { fg = fg },

		Cursor = { fg = M.tokens.background[100], bg = fg },
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },

		Directory = { fg = fg },
		DiffAdd = { bg = M.tokens.background[100], fg = diff_add },
		DiffChange = { bg = M.tokens.background[100], fg = diff_change },
		DiffDelete = { bg = M.tokens.background[100], fg = diff_delete },
		DiffText = { bg = M.tokens.background[100], fg = diff_text },

		VertSplit = { fg = M.tokens.gray[200], bg = "NONE" },
		Winseparator = { link = "VertSplit" },
		SignColumn = { link = "Normal" },

		Folded = { fg = comment, bg = M.tokens.gray[100] },
		FoldColumn = { link = "SignColumn" },

		Search = { link = "Visual" },
		IncSearch = { link = "Visual" },
		Substitute = { link = "Visual" },
		MatchParen = { fg = M.tokens.pink[700] },

		ModeMsg = { link = "Normal" },
		MsgArea = { link = "Normal" },
		MsgSeparator = { link = "Normal" },

		ErrorMsg = { fg = M.tokens.red[900] },
		WarningMsg = { fg = M.tokens.amber[900] },
		MoreMsg = { fg = M.tokens.blue[900] },

		Pmenu = { link = "NormalFloat" },
		PmenuSel = { link = "CursorLine" },
		PmenuSbar = { bg = M.tokens.gray[200] },
		PmenuThumb = { bg = M.tokens.gray[800] },

		Question = { fg = M.tokens.purple[600] },
		QuickFixLine = { fg = M.tokens.purple[600] },
		SpecialKey = { fg = comment },

		StatusLine = { link = "CursorLine" },
		StatusLineNC = {
			fg = comment,
			bg = M.config.transparent and "NONE" or M.tokens.gray[100],
		},

		TabLine = { fg = comment, bg = bg },
		TabLineFill = { link = "TabLine" },
		TabLineSel = { bg = M.tokens.background[100], fg = fg },

		SpellBad = { undercurl = true, sp = M.tokens.red[600] },
		SpellCap = { undercurl = true, sp = M.tokens.purple[600] },
		SpellLocal = { undercurl = true, sp = M.tokens.blue[600] },
		SpellRare = { undercurl = true, sp = M.tokens.amber[600] },

		Whitespace = { fg = M.tokens.background[100] },
		WildMenu = { link = "Pmenu" },

		Comment = {
			fg = comment,
			italic = M.config.italics.comments or false,
		},
		Constant = { fg = M.tokens.blue[900] },
		Identifier = { link = "Constant" },
		String = {
			fg = M.tokens.green[900],
			italic = M.config.italics.strings or false,
		},
		Character = { link = "String" },
		Number = { link = "Constant" },
		Float = { link = "Constant" },
		Boolean = { link = "Constant" },

		Function = { fg = M.tokens.purple[900] },
		Method = { link = "Function" },

		Property = { fg = M.tokens.pink[900] },
		Field = { link = "Property" },

		Parameter = { fg = fg },
		Statement = { fg = M.tokens.pink[900] },
		-- Conditional = {},
		-- Repeat = {},

		Label = { fg = M.tokens.pink[900] },
		Operator = { link = "Statement" },
		Keyword = { link = "Statement", italic = M.config.italics.keywords or false },
		Exception = { link = "Statement" },

		PreProc = { link = "Statement" },
		Include = { link = "Statement" },
		Define = { fg = M.tokens.blue[900] },
		Macro = { link = "Define" },
		PreCondit = { link = "Statement" },

		Type = { fg = M.tokens.purple[900] },
		Struct = { link = "Type" },
		Class = { link = "Type" },

		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Attribute = { link = "Character" },
		Punctuation = { fg = fg },
		Special = { fg = fg },
		SpecialChar = { fg = M.utils.shade(M.tokens.green[900], 0.8) },
		Tag = { link = "String" },
		Delimiter = { fg = fg },
		-- SpecialComment = {},

		Text = { fg = fg },
		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Ignore = { fg = comment },
		Error = { link = "ErrorMsg" },
		Todo = { link = "WarningMsg", bold = true },
		Debug = { fg = fg },

		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		LspInlayHint = { link = "Comment" },
		-- LspReferenceRead = {},
		-- LspReferenceText = {},
		-- LspReferenceWrite = {},
		-- LspSignatureActiveParameter = {},

		DiagnosticError = { link = "ErrorMsg" },
		DiagnosticWarn = { link = "WarningMsg" },
		DiagnosticInfo = { fg = M.tokens.purple[600] },
		DiagnosticHint = { fg = M.tokens.blue[600] },
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

		["@text"] = { link = "Text" },
		["@texcolorscheme.literal"] = { link = "Property" },
		-- ["@texcolorscheme.reference"] = {},
		["@texcolorscheme.strong"] = { link = "Bold" },
		["@texcolorscheme.italic"] = { link = "Italic" },
		["@texcolorscheme.title"] = { link = "Keyword" },
		["@texcolorscheme.uri"] = {
			fg = M.tokens.purple[600],
			sp = M.tokens.purple[600],
			underline = true,
		},
		["@texcolorscheme.underline"] = { link = "Underlined" },
		["@symbol"] = { link = "Text" },
		["@texcolorscheme.todo"] = { link = "Todo" },
		["@comment"] = { link = "Comment" },
		["@punctuation"] = { link = "Punctuation" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.terminator.statement"] = { link = "Delimiter" },
		["@punctuation.special"] = { link = "Keyword" },
		["@punctuation.separator.keyvalue"] = { link = "Keyword" },

		["@texcolorscheme.diff.add"] = { link = "DiffAdd" },
		["@texcolorscheme.diff.delete"] = { link = "DiffDelete" },
		["@texcolorscheme.diff.change"] = { link = "DiffChange" },
		["@texcolorscheme.diff.text"] = { link = "DiffText" },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@constancolorscheme.builtin"] = { link = "Keyword" },
		-- ["@constancolorscheme.macro"] = {},
		-- ["@define"] = {},
		-- ["@macro"] = {},
		["@string"] = { link = "String" },
		-- ["@character"] = {},
		-- ["@character.special"] = {},
		["@number"] = { link = "Number" },
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
		["@constructor"] = { link = "Function" },
		-- ["@conditional"] = {},
		-- ["@repeat"] = {},
		["@label"] = { link = "Label" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@variable"] = {
			link = "Text",
			italic = M.config.italics.variables or false,
		},
		["@variable.builtin"] = { link = "Constant" },
		["@variable.member"] = { link = "Text" },
		["@variable.parameter"] = {
			link = "Parameter",
			italic = M.config.italics.variables or false,
		},
		["@type"] = { link = "Type" },
		["@type.definition"] = { link = "Type" },
		["@type.builtin"] = { link = "Constant" },
		["@type.qualifier"] = { link = "Type" },
		["@type.tsx"] = { link = "Text" },
		["@module.tsx"] = { link = "Text" },
		["@keyword"] = { link = "Keyword" },
		-- ["@storageclass"] = {},
		-- ["@structure"] = {},
		["@namespace"] = { link = "Type" },
		["@annotation"] = { link = "Label" },
		-- ["@include"] = {},
		-- ["@preproc"] = {},
		["@debug"] = { link = "Debug" },
		["@tag"] = { link = "Tag" },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@tag.attribute"] = { link = "Type" },
		["@tag.tsx"] = { link = "Constant" },
		["@attribute"] = { link = "Constant" },
		["@error"] = { link = "Error" },
		["@warning"] = { link = "WarningMsg" },
		["@info"] = { link = "Type" },

		-- Specific languages
		-- overrides
		["@label.json"] = { link = "Label" }, -- For json
		["@label.help"] = { link = "@texcolorscheme.uri" }, -- For help files
		["@texcolorscheme.uri.html"] = { underline = true }, -- For html
		["@markup.heading"] = { link = "Text", bold = true }, -- For markdown

		-- semantic highlighting
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@function" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@function" },
		["@lsp.type.interface"] = { link = "@function" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "Text" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@label" },
		["@lsp.type.decorator"] = { link = "@label" },
		["@lsp.type.variable"] = { link = "Text" },
	}

	-- integrations
	-- groups = vim.tbl_extend("force", groups, require("vercel.integrations.{pack}").highlights())
	groups = vim.tbl_extend("force", groups, require("vercel.integrations.blink-cmp").highlights(M.config))
	groups = vim.tbl_extend("force", groups, require("vercel.integrations.cmp").highlights(M.config))

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
