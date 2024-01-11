---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin delete mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.delete = {
	name = "delete",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["D"] = {
				help = "force delete",
				messages = {
					{
						BashExec0 = [===[
              while IFS= read -r -d '' PTH; do
                printf '%q\n' "$PTH"
              done < "${XPLR_PIPE_RESULT_OUT:?}"
              echo
              read -p "Permanently delete these files? [Y/n]: " ANS
              [ "${ANS:-Y}" = "Y" ] || [ "$ANS" = "y" ] || exit 0
              echo

              "$XPLR" -m ExplorePwd
              while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if rm -rfv -- "${PTH:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                else
                  "$XPLR" -m 'LogError: %q' "could not delete $PTH_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$PTH"
                fi
              done < "${XPLR_PIPE_RESULT_OUT:?}"
              echo
              read -p "[press enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["d"] = {
				help = "delete",
				messages = {
					{
						BashExec0 = [===[
              while IFS= read -r -d '' PTH; do
                printf '%q\n' "$PTH"
              done < "${XPLR_PIPE_RESULT_OUT:?}"
              echo
              read -p "Permanently delete these files? [Y/n]: " ANS
              [ "${ANS:-Y}" = "Y" ] || [ "$ANS" = "y" ] || exit 0
              echo

              "$XPLR" -m ExplorePwd
              while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if [ -d "$PTH" ] && [ ! -L "$PTH" ]; then
                  if rmdir -v -- "${PTH:?}"; then
                    "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                  else
                    "$XPLR" -m 'LogError: %q' "could not delete $PTH_ESC"
                    "$XPLR" -m 'FocusPath: %q' "$PTH"
                  fi
                else
                  if rm -v -- "${PTH:?}"; then
                    "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                  else
                    "$XPLR" -m 'LogError: %q' "could not delete $PTH_ESC"
                    "$XPLR" -m 'FocusPath: %q' "$PTH"
                  fi
                fi
              done < "${XPLR_PIPE_RESULT_OUT:?}"
              echo
              read -p "[press enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
		},
	},
}
