---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin quit mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.quit = {
	name = "quit",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "just quit",
				messages = {
					"Quit",
				},
			},
			["p"] = {
				help = "quit printing pwd",
				messages = {
					"PrintPwdAndQuit",
				},
			},
			["f"] = {
				help = "quit printing focus",
				messages = {
					"PrintFocusPathAndQuit",
				},
			},
			["s"] = {
				help = "quit printing selection",
				messages = {
					"PrintSelectionAndQuit",
				},
			},
			["r"] = {
				help = "quit printing result",
				messages = {
					"PrintResultAndQuit",
				},
			},
		},
	},
}
