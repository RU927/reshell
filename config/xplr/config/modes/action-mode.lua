---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin action mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.action = {
	name = "action to",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["!"] = {
				help = "shell",
				messages = {
					"PopMode",
					{ Call0 = { command = os.getenv("SHELL") or "bash", args = { "-i" } } },
					"ExplorePwdAsync",
				},
			},
			["c"] = {
				help = "create",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create" },
				},
			},
			["e"] = {
				help = "open in editor",
				messages = {
					{
						BashExec0 = [===[
              ${EDITOR:-vi} "${XPLR_FOCUS_PATH:?}"
            ]===],
					},
					"PopMode",
				},
			},
			["l"] = {
				help = "logs",
				messages = {
					{
						BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_LOGS_OUT}" | ${PAGER:?}
            ]===],
					},
					"PopMode",
				},
			},
			["s"] = {
				help = "selection operations",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "selection_ops" },
				},
			},
			["m"] = {
				help = "toggle mouse",
				messages = {
					"PopMode",
					"ToggleMouse",
				},
			},
			["p"] = {
				help = "edit permissions",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "edit_permissions" },
					{
						BashExecSilently0 = [===[
              PERM=$(stat -c '%a' -- "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${PERM:?}"
            ]===],
					},
				},
			},
			["v"] = {
				help = "vroot",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "vroot" },
				},
			},
			["q"] = {
				help = "quit options",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "quit" },
				},
			},
		},
		on_number = {
			help = "go to index",
			messages = {
				"PopMode",
				{ SwitchModeBuiltin = "number" },
				"BufferInputFromKey",
			},
		},
	},
}
