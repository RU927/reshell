---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin create mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create = {
	name = "create",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["d"] = {
				help = "create directory",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create_directory" },
					{ SetInputBuffer = "" },
				},
			},
			["f"] = {
				help = "create file",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create_file" },
					{ SetInputBuffer = "" },
				},
			},
		},
	},
}
