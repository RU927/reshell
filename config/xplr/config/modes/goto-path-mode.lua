---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- From https://github.com/sayanarijit/.files/blob/6663084b97d3283475ecef25fcafd0bea142ab23/nixpkgs/files/xplr/init.lua#L85
xplr.config.modes.builtin.go_to.key_bindings.on_key.p = {
	help = "go to path",
	messages = {
		"PopMode",
		{ SwitchModeCustom = "go_to_path" },
		{ SetInputBuffer = "" },
	},
}
-- The builtin go to path mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.go_to_path = {
	name = "go to path",
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "submit",
				messages = {
					---[[
					{
						BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ -d "$PTH" ]; then
                "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
              elif [ -e "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m 'LogError: %q' "could not find $PTH_ESC"
              fi
            ]===],
					},
					--]]
					-- "FocusPathFromInput",
					"PopMode",
				},
			},
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
					-- { CallLuaSilently = 'custom.completion.complete_path' },
				},
			},
			-- ["esc"] = {
			-- 	help = "cancel",
			-- 	messages = { "PopMode" },
			-- },
			["ctrl-c"] = {
				help = "terminate",
				messages = { "Terminate" },
			},
			["backspace"] = {
				help = "remove last character",
				messages = { "RemoveInputBufferLastCharacter" },
			},
			["ctrl-u"] = {
				help = "remove line",
				messages = { { SetInputBuffer = "" } },
			},
			["ctrl-w"] = {
				help = "remove last word",
				messages = { "RemoveInputBufferLastWord" },
			},
			default = {
				messages = {
					"UpdateInputBufferFromKey",
				},
			},
		},
	},
}
