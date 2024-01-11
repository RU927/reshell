---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin number mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.number = {
	name = "number",
	prompt = ":",
	key_bindings = {
		on_key = {
			["down"] = {
				help = "to down",
				messages = {
					"FocusNextByRelativeIndexFromInput",
					"PopMode",
				},
			},
			["enter"] = {
				help = "to index",
				messages = {
					"FocusByIndexFromInput",
					"PopMode",
				},
			},
			["up"] = {
				help = "to up",
				messages = {
					"FocusPreviousByRelativeIndexFromInput",
					"PopMode",
				},
			},
		},
		on_navigation = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
		on_number = {
			help = "input",
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}

xplr.config.modes.builtin.number.key_bindings.on_key["j"] = xplr.config.modes.builtin.number.key_bindings.on_key["down"]
xplr.config.modes.builtin.number.key_bindings.on_key["k"] = xplr.config.modes.builtin.number.key_bindings.on_key["up"]
