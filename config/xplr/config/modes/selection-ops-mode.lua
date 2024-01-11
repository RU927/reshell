---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin selection ops mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.selection_ops = {
	name = "selection ops",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["e"] = {
				help = "edit selection",
				messages = {
					{
						BashExec0 = [===[
              TMPFILE="$(mktemp)"
              while IFS= read -r -d '' PTH; do
                echo $(printf %q "${PTH:?}") >> "${TMPFILE:?}"
              done < "${XPLR_PIPE_SELECTION_OUT:?}"
              ${EDITOR:-vi} "${TMPFILE:?}"
              [ ! -e "$TMPFILE" ] && exit
              "$XPLR" -m ClearSelection
              while IFS= read -r PTH_ESC; do
                "$XPLR" -m 'SelectPath: %q' "$(eval printf %s ${PTH_ESC:?})"
              done < "${TMPFILE:?}"
              rm -- "${TMPFILE:?}"
            ]===],
					},
					"PopMode",
				},
			},
			["l"] = {
				help = "list selection",
				messages = {
					{
						BashExec0 = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"

              while IFS= read -r -d '' PTH; do
                echo $(printf %q "$PTH")
              done < "${XPLR_PIPE_SELECTION_OUT:?}" | ${PAGER:?}
            ]===],
					},
					"PopMode",
				},
			},
			["c"] = {
				help = "copy here",
				messages = {
					{
						BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                if [ -e "$BASENAME" ]; then
                  echo
                  echo "$BASENAME_ESC exists, do you want to overwrite it?"
                  read -p "[y]es, [n]o, [S]kip: " ANS < /dev/tty
                  case "$ANS" in
                    [yY]*)
                      ;;
                    [nN]*)
                      read -p "Enter new name: " BASENAME < /dev/tty
                      BASENAME_ESC=$(printf %q "$BASENAME")
                      ;;
                    *)
                      continue
                      ;;
                  esac
                fi
                if cp -vr -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC copied to ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not copy $PTH_ESC to ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}"
              echo
              read -p "[press enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["m"] = {
				help = "move here",
				messages = {
					{
						BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                if [ -e "$BASENAME" ]; then
                  echo
                  echo "$BASENAME_ESC exists, do you want to overwrite it?"
                  read -p "[y]es, [n]o, [S]kip: " ANS < /dev/tty
                  case "$ANS" in
                    [yY]*)
                      ;;
                    [nN]*)
                      read -p "Enter new name: " BASENAME < /dev/tty
                      BASENAME_ESC=$(printf %q "$BASENAME")
                      ;;
                    *)
                      continue
                      ;;
                  esac
                fi
                if mv -v -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC moved to ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not move $PTH_ESC to ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}"
              echo
              read -p "[press enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["s"] = {
				help = "softlink here",
				messages = {
					{
						BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                if [ -e "$BASENAME" ]; then
                  echo
                  echo "$BASENAME_ESC exists, do you want to overwrite it?"
                  read -p "[y]es, [n]o, [S]kip: " ANS < /dev/tty
                  case "$ANS" in
                    [yY]*)
                      ;;
                    [nN]*)
                      read -p "Enter new name: " BASENAME < /dev/tty
                      BASENAME_ESC=$(printf %q "$BASENAME")
                      ;;
                    *)
                      continue
                      ;;
                  esac
                fi
                if ln -sv -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC softlinked as ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not softlink $PTH_ESC as ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}"
              echo
              read -p "[press enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["h"] = {
				help = "hardlink here",
				messages = {
					{
						BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                if [ -e "$BASENAME" ]; then
                  echo
                  echo "$BASENAME_ESC exists, do you want to overwrite it?"
                  read -p "[y]es, [n]o, [S]kip: " ANS < /dev/tty
                  case "$ANS" in
                    [yY]*)
                      ;;
                    [nN]*)
                      read -p "Enter new name: " BASENAME < /dev/tty
                      BASENAME_ESC=$(printf %q "$BASENAME")
                      ;;
                    *)
                      continue
                      ;;
                  esac
                fi
                if ln -v -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC hardlinked as ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not hardlink $PTH_ESC as ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}"
              echo
              read -p "[press enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["u"] = {
				help = "clear selection",
				messages = {
					"ClearSelection",
					"PopMode",
				},
			},
		},
	},
}
