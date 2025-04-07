local colors = require("vercel.colors")

local M = {}

--- @param options Options
function M.highlights(options)
	local bg = options.transparent and "NONE" or colors.popupBackground

	return {
		NavicIconsFile = { bg = bg },
		NavicIconsModule = { bg = bg },
		NavicIconsNamespace = { bg = bg },
		NavicIconsPackage = { bg = bg },
		NavicIconsClass = { bg = bg },
		NavicIconsMethod = { bg = bg },
		NavicIconsProperty = { bg = bg },
		NavicIconsField = { bg = bg },
		NavicIconsConstructor = { bg = bg },
		NavicIconsEnum = { bg = bg },
		NavicIconsInterface = { bg = bg },
		NavicIconsFunction = { bg = bg },
		NavicIconsVariable = { bg = bg },
		NavicIconsConstant = { bg = bg },
		NavicIconsString = { bg = bg },
		NavicIconsNumber = { bg = bg },
		NavicIconsBoolean = { bg = bg },
		NavicIconsArray = { bg = bg },
		NavicIconsObject = { bg = bg },
		NavicIconsKey = { bg = bg },
		NavicIconsNull = { bg = bg },
		NavicIconsEnumMember = { bg = bg },
		NavicIconsStruct = { bg = bg },
		NavicIconsEvent = { bg = bg },
		NavicIconsOperator = { bg = bg },
		NavicIconsTypeParameter = { bg = bg },
		NavicText = { bg = bg },
		NavicSeparator = { bg = bg },
	}
end

return M
