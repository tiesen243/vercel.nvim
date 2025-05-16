local config = {
	---@type Options
	defaults = {
		theme = "light",
		transparent = false,
		italics = {
			comments = true,
			keywords = true,
			functions = true,
			strings = true,
			variables = true,
			bufferline = false,
		},
		overrides = {},
	},
}

setmetatable(config, { __index = config.defaults })

return config
