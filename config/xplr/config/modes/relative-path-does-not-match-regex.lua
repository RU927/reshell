---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin relative_path_does_not_match_regex mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.relative_path_does_not_match_regex = {
	name = "relative path does not match regex",
	prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesNotMatchRegex.format,
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "submit",
				messages = {
					"PopMode",
				},
			},
			["esc"] = {
				messages = {
					{ RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
					"PopMode",
					"ExplorePwdAsync",
				},
			},
		},
		default = {
			messages = {
				{ RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
				"UpdateInputBufferFromKey",
				{ AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
				"ExplorePwdAsync",
			},
		},
	},
}
