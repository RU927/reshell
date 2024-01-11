---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin go to mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.go_to = {
	name = "go to",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["f"] = {
				help = "follow symlink",
				messages = {
					"FollowSymlink",
					"PopMode",
				},
			},
			["g"] = {
				help = "top",
				messages = {
					"FocusFirst",
					"PopMode",
				},
			},
			["p"] = {
				help = "path",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "go_to_path" },
					{ SetInputBuffer = "" },
				},
			},
			["i"] = {
				help = "initial $PWD",
				messages = {
					"PopMode",
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${XPLR_INITIAL_PWD:?}"
            ]===],
					},
				},
			},
			["x"] = {
				help = "open in gui",
				messages = {
					{
						BashExecSilently0 = [===[
              if [ -z "$OPENER" ]; then
                if command -v xdg-open; then
                  OPENER=xdg-open
                elif command -v open; then
                  OPENER=open
                else
                  "$XPLR" -m 'LogError: %q' "$OPENER not found"
                  exit 1
                fi
              fi
              while IFS= read -r -d '' PTH; do
                $OPENER "${PTH:?}" > /dev/null 2>&1
              done < "${XPLR_PIPE_RESULT_OUT:?}"
            ]===],
					},
					"ClearScreen",
					"PopMode",
				},
			},
		},
	},
}
