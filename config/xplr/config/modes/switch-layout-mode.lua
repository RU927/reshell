---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin switch layout mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.switch_layout = {
	name = "switch layout",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["1"] = {
				help = "default",
				messages = {
					{ SwitchLayoutBuiltin = "default" },
					"PopMode",
				},
			},
			["2"] = {
				help = "no help menu",
				messages = {
					{ SwitchLayoutBuiltin = "no_help" },
					"PopMode",
				},
			},
			["3"] = {
				help = "no selection panel",
				messages = {
					{ SwitchLayoutBuiltin = "no_selection" },
					"PopMode",
				},
			},
			["4"] = {
				help = "no help or selection",
				messages = {
					{ SwitchLayoutBuiltin = "no_help_no_selection" },
					"PopMode",
				},
			},
		},
	},
}
