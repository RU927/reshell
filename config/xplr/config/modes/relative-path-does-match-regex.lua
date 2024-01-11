---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin relative_path_does_match_regex mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.relative_path_does_match_regex = {
	name = "relative path does match regex",
	prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesMatchRegex.format,
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
					{ RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
					"PopMode",
					"ExplorePwdAsync",
				},
			},
		},
		default = {
			messages = {
				{ RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
				"UpdateInputBufferFromKey",
				{ AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
				"ExplorePwdAsync",
			},
		},
	},
}
