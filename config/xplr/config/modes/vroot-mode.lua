---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin vroot mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.vroot = {
	name = "vroot",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["v"] = {
				help = "toggle vroot",
				messages = {
					"PopMode",
					"ToggleVroot",
				},
			},
			["."] = {
				help = "vroot $PWD",
				messages = {
					"PopMode",
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetVroot: %q' "${PWD:?}"
            ]===],
					},
				},
			},
			["/"] = {
				help = "vroot /",
				messages = {
					"PopMode",
					{ SetVroot = "/" },
				},
			},
			["~"] = {
				help = "vroot $HOME",
				messages = {
					"PopMode",
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetVroot: %q' "${HOME:?}"
            ]===],
					},
				},
			},
			["ctrl-r"] = {
				help = "reset vroot",
				messages = {
					"PopMode",
					"ResetVroot",
				},
			},
			["ctrl-u"] = {
				help = "unset vroot",
				messages = {
					"PopMode",
					"UnsetVroot",
				},
			},
		},
	},
}
