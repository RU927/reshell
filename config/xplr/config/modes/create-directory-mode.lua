---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin create directory mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create_directory = {
	name = "create directory",
	prompt = "ð ❯ ",
	key_bindings = {
		on_key = {
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ "$PTH" ]; then
                mkdir -p -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m ExplorePwd \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m PopMode
              fi
            ]===],
					},
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
