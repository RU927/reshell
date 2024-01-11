---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin filter mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.filter = {
	name = "filter",
	key_bindings = {
		on_key = {
			["r"] = {
				help = "relative path does match regex",
				messages = {
					{ SwitchModeBuiltin = "relative_path_does_match_regex" },
					{ SetInputBuffer = "" },
					{ AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
					"ExplorePwdAsync",
				},
			},
			["R"] = {
				help = "relative path does not match regex",
				messages = {
					{ SwitchModeBuiltin = "relative_path_does_not_match_regex" },
					{ SetInputBuffer = "" },
					{ AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
					"ExplorePwdAsync",
				},
			},
			["backspace"] = {
				help = "remove last filter",
				messages = {
					"RemoveLastNodeFilter",
					"ExplorePwdAsync",
				},
			},
			["ctrl-r"] = {
				help = "reset filters",
				messages = {
					"ResetNodeFilters",
					"ExplorePwdAsync",
				},
			},
			["ctrl-u"] = {
				help = "clear filters",
				messages = {
					"ClearNodeFilters",
					"ExplorePwdAsync",
				},
			},
		},
	},
}
