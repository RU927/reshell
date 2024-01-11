---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin debug error mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.debug_error = {
	name = "debug error",
	layout = {
		Vertical = {
			config = {
				constraints = {
					{ Min = 14 },
					{ MinLessThanScreenHeight = 14 },
				},
			},
			splits = {
				{
					Static = {
						CustomParagraph = {
							ui = { title = { format = "debug error" } },
							body = [[

  Some errors occurred during startup.
  If you think this is a bug, please report it at:

  https://github.com/sayanarijit/xplr/issues/new

  Press `enter` to open the logs in your $EDITOR.
  Press `escape` to ignore the errors and continue with the default config.

  To disable this mode, set `xplr.config.general.disable_debug_error_mode`
  to `true` in your config file.
              ]],
						},
					},
				},
				"InputAndLogs",
			},
		},
	},
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "open logs in editor",
				messages = {
					{
						BashExec = [===[
              cat "${XPLR_PIPE_LOGS_OUT:?}" | ${EDITOR:-vi} -
            ]===],
					},
				},
			},
			["q"] = {
				help = "quit",
				messages = {
					"Quit",
				},
			},
		},
		default = {
			messages = {},
		},
	},
}
