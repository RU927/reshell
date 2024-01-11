---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin recover mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.recover = {
	name = "recover",
	layout = {
		Static = {
			CustomParagraph = {
				ui = { title = { format = "recover" } },
				body = [[

  You pressed an invalid key and went into "recover" mode.
  This mode saves you from performing unwanted actions.

  Let's calm down, press `escape`, and try again.

  To disable this mode, set `xplr.config.general.enable_recover_mode`
  to `false` in your config file.
        ]],
			},
		},
	},
	key_bindings = {
		default = {
			messages = {},
		},
	},
}
