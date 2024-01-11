---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ### Modes ------------------------------------------------------------------
--
-- xplr is a modal file explorer. That means the users switch between different
-- modes, each containing a different set of key bindings to avoid clashes.
-- Users can switch between these modes at run-time.
--
-- The modes can be configured using the `xplr.config.modes` Lua API.
--
-- `xplr.config.modes.builtin` contain some built-in modes which can be
-- overridden, but you can't add or remove modes in it.

-- The builtin default mode.
-- Visit the [Default Key Bindings](https://xplr.dev/en/default-key-bindings)
-- to see what each mode does.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.default = {
	name = "default",
	key_bindings = {
		on_key = {
			["#"] = {
				messages = {
					"PrintAppStateAndQuit",
				},
			},
			["."] = {
				help = "show hidden",
				messages = {
					{
						ToggleNodeFilter = { filter = "RelativePathDoesNotStartWith", input = "." },
					},
					"ExplorePwdAsync",
				},
			},
			[":"] = {
				help = "action",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "action" },
				},
			},
			["G"] = {
				help = "go to bottom",
				messages = {
					"PopMode",
					"FocusLast",
				},
			},
			["ctrl-a"] = {
				help = "select/unselect all",
				messages = {
					"ToggleSelectAll",
				},
			},
			["ctrl-f"] = {
				help = "search",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "search" },
					{ SetInputBuffer = "" },
				},
			},
			["ctrl-i"] = {
				help = "next visited path",
				messages = {
					"NextVisitedPath",
				},
			},
			["ctrl-o"] = {
				help = "last visited path",
				messages = {
					"LastVisitedPath",
				},
			},
			[")"] = {
				help = "next deep branch",
				messages = {
					"NextVisitedDeepBranch",
				},
			},
			["("] = {
				help = "prev deep branch",
				messages = {
					"PreviousVisitedDeepBranch",
				},
			},
			["ctrl-r"] = {
				help = "refresh screen",
				messages = {
					"ClearScreen",
				},
			},
			["ctrl-u"] = {
				help = "clear selection",
				messages = {
					"ClearSelection",
				},
			},
			["ctrl-w"] = {
				help = "switch layout",
				messages = {
					{ SwitchModeBuiltin = "switch_layout" },
				},
			},
			["d"] = {
				help = "delete",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "delete" },
				},
			},
			["down"] = {
				help = "down",
				messages = {
					"FocusNext",
				},
			},
			["enter"] = {
				help = "quit with result",
				messages = {
					"PrintResultAndQuit",
				},
			},
			["f"] = {
				help = "filter",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "filter" },
				},
			},
			["g"] = {
				help = "go to",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "go_to" },
				},
			},
			["left"] = {
				help = "back",
				messages = {
					"Back",
				},
			},
			["q"] = {
				help = "quit",
				messages = {
					"Quit",
				},
			},
			["r"] = {
				help = "rename",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "rename" },
					{
						BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
					},
				},
			},
			["ctrl-d"] = {
				help = "duplicate as",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "duplicate_as" },
					{
						BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
					},
				},
			},
			["right"] = {
				help = "enter",
				messages = {
					"Enter",
				},
			},
			["s"] = {
				help = "sort",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "sort" },
				},
			},
			["space"] = {
				help = "toggle selection",
				messages = {
					"ToggleSelection",
					"FocusNext",
				},
			},
			["up"] = {
				help = "up",
				messages = {
					"FocusPrevious",
				},
			},
			["~"] = {
				help = "go home",
				messages = {
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
            ]===],
					},
				},
			},
			["page-up"] = {
				help = "scroll up",
				messages = {
					"ScrollUp",
				},
			},
			["page-down"] = {
				help = "scroll down",
				messages = {
					"ScrollDown",
				},
			},
			["{"] = {
				help = "scroll up half",
				messages = {
					"ScrollUpHalf",
				},
			},
			["}"] = {
				help = "scroll down half",
				messages = {
					"ScrollDownHalf",
				},
			},
			["ctrl-n"] = {
				help = "next selection",
				messages = {
					"FocusNextSelection",
				},
			},
			["ctrl-p"] = {
				help = "prev selection",
				messages = {
					"FocusPreviousSelection",
				},
			},
		},
		on_number = {
			help = "input",
			messages = {
				"PopMode",
				{ SwitchModeBuiltin = "number" },
				"BufferInputFromKey",
			},
		},
	},
}

xplr.config.modes.builtin.default.key_bindings.on_key["v"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["space"]
xplr.config.modes.builtin.default.key_bindings.on_key["V"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-a"]
xplr.config.modes.builtin.default.key_bindings.on_key["/"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-f"]
xplr.config.modes.builtin.default.key_bindings.on_key["h"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["left"]
xplr.config.modes.builtin.default.key_bindings.on_key["j"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["down"]
xplr.config.modes.builtin.default.key_bindings.on_key["k"] = xplr.config.modes.builtin.default.key_bindings.on_key["up"]
xplr.config.modes.builtin.default.key_bindings.on_key["l"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["right"]
xplr.config.modes.builtin.default.key_bindings.on_key["tab"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-i"] -- compatibility workaround
xplr.config.modes.builtin.default.key_bindings.on_key["?"] = xplr.config.general.global_key_bindings.on_key["f1"]

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
					"PopMode",
				},
			},
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
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

-- The builtin create mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create = {
	name = "create",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["d"] = {
				help = "create directory",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create_directory" },
					{ SetInputBuffer = "" },
				},
			},
			["f"] = {
				help = "create file",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create_file" },
					{ SetInputBuffer = "" },
				},
			},
		},
	},
}

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

-- The builtin create file mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create_file = {
	name = "create file",
	prompt = "ƒ ❯ ",
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
                mkdir -p -- "$(dirname $(realpath -m $PTH))"  # This may fail.
                touch -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'ExplorePwd' \
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

-- The builtin number mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.number = {
	name = "number",
	prompt = ":",
	key_bindings = {
		on_key = {
			["down"] = {
				help = "to down",
				messages = {
					"FocusNextByRelativeIndexFromInput",
					"PopMode",
				},
			},
			["enter"] = {
				help = "to index",
				messages = {
					"FocusByIndexFromInput",
					"PopMode",
				},
			},
			["up"] = {
				help = "to up",
				messages = {
					"FocusPreviousByRelativeIndexFromInput",
					"PopMode",
				},
			},
		},
		on_navigation = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
		on_number = {
			help = "input",
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}

xplr.config.modes.builtin.number.key_bindings.on_key["j"] = xplr.config.modes.builtin.number.key_bindings.on_key["down"]
xplr.config.modes.builtin.number.key_bindings.on_key["k"] = xplr.config.modes.builtin.number.key_bindings.on_key["up"]

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

-- The builtin rename mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.rename = {
	name = "rename",
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
              SRC="${XPLR_FOCUS_PATH:?}"
              SRC_ESC=$(printf %q "$SRC")
              TARGET="${XPLR_INPUT_BUFFER:?}"
              TARGET_ESC=$(printf %q "$TARGET")
              if [ -e "${TARGET:?}" ]; then
                "$XPLR" -m 'LogError: %q' "$TARGET_ESC already exists"
              else
                mv -- "${SRC:?}" "${TARGET:?}" \
                  && "$XPLR" -m ExplorePwd \
                  && "$XPLR" -m 'FocusPath: %q' "$TARGET" \
                  && "$XPLR" -m 'LogSuccess: %q' "$SRC_ESC renamed to $TARGET_ESC"
              fi
            ]===],
					},
					"PopMode",
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

-- The builtin duplicate as mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.duplicate_as = {
	name = "duplicate as",
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
              SRC="${XPLR_FOCUS_PATH:?}"
              SRC_ESC=$(printf %q "$SRC")
              TARGET="${XPLR_INPUT_BUFFER:?}"
              TARGET_ESC=$(printf %q "$TARGET")
              if [ -e "${TARGET:?}" ]; then
                "$XPLR" -m 'LogError: %q' "$TARGET_ESC already exists"
              else
                cp -r -- "${SRC:?}" "${TARGET:?}" \
                  && "$XPLR" -m ExplorePwd \
                  && "$XPLR" -m 'FocusPath: %q' "$TARGET_ESC" \
                  && "$XPLR" -m 'LogSuccess: %q' "$SRC_ESC duplicated as $TARGET_ESC"
              fi
            ]===],
					},
					"PopMode",
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

-- The builtin search mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.search = {
	name = "search",
	prompt = "/",
	key_bindings = {
		on_key = {
			["up"] = {
				help = "up",
				messages = {
					"FocusPrevious",
				},
			},
			["down"] = {
				help = "down",
				messages = {
					"FocusNext",
				},
			},
			["ctrl-z"] = {
				help = "toggle ordering",
				messages = {
					"ToggleSearchOrder",
					"ExplorePwdAsync",
				},
			},
			["ctrl-a"] = {
				help = "toggle search algorithm",
				messages = {
					"ToggleSearchAlgorithm",
					"ExplorePwdAsync",
				},
			},
			["ctrl-r"] = {
				help = "regex search",
				messages = {
					"SearchRegexFromInput",
					"ExplorePwdAsync",
				},
			},
			["ctrl-f"] = {
				help = "fuzzy search",
				messages = {
					"SearchFuzzyFromInput",
					"ExplorePwdAsync",
				},
			},
			["ctrl-s"] = {
				help = "sort (no search order)",
				messages = {
					"DisableSearchOrder",
					"ExplorePwdAsync",
					{ SwitchModeBuiltinKeepingInputBuffer = "sort" },
				},
			},
			["right"] = {
				help = "enter",
				messages = {
					"Enter",
					{ SetInputBuffer = "" },
				},
			},
			["left"] = {
				help = "back",
				messages = {
					"Back",
					{ SetInputBuffer = "" },
				},
			},
			["tab"] = {
				help = "toggle selection",
				messages = {
					"ToggleSelection",
					"FocusNext",
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					"AcceptSearch",
					"PopMode",
				},
			},
			["esc"] = {
				help = "cancel",
				messages = {
					"CancelSearch",
					"PopMode",
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
				"SearchFromInput",
				"ExplorePwdAsync",
			},
		},
	},
}

xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-n"] =
	xplr.config.modes.builtin.search.key_bindings.on_key["down"]
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-p"] =
	xplr.config.modes.builtin.search.key_bindings.on_key["up"]

-- The builtin filter mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.filter = {
	name = "filter",
	key_bindings = {
		on_key = {
			["r"] = {
				help = "relative path does match regex",
				messages = {
					{ SwitchModeBuiltin = "relative_path_does_match_regex" },
					{ SetInputBuffer = "" },
					{ AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
					"ExplorePwdAsync",
				},
			},
			["R"] = {
				help = "relative path does not match regex",
				messages = {
					{ SwitchModeBuiltin = "relative_path_does_not_match_regex" },
					{ SetInputBuffer = "" },
					{ AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
					"ExplorePwdAsync",
				},
			},
			["backspace"] = {
				help = "remove last filter",
				messages = {
					"RemoveLastNodeFilter",
					"ExplorePwdAsync",
				},
			},
			["ctrl-r"] = {
				help = "reset filters",
				messages = {
					"ResetNodeFilters",
					"ExplorePwdAsync",
				},
			},
			["ctrl-u"] = {
				help = "clear filters",
				messages = {
					"ClearNodeFilters",
					"ExplorePwdAsync",
				},
			},
		},
	},
}

-- The builtin relative_path_does_match_regex mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.relative_path_does_match_regex = {
	name = "relative path does match regex",
	prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesMatchRegex.format,
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "submit",
				messages = {
					"PopMode",
				},
			},
			["esc"] = {
				messages = {
					{ RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
					"PopMode",
					"ExplorePwdAsync",
				},
			},
		},
		default = {
			messages = {
				{ RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
				"UpdateInputBufferFromKey",
				{ AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
				"ExplorePwdAsync",
			},
		},
	},
}

-- The builtin relative_path_does_not_match_regex mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.relative_path_does_not_match_regex = {
	name = "relative path does not match regex",
	prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesNotMatchRegex.format,
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "submit",
				messages = {
					"PopMode",
				},
			},
			["esc"] = {
				messages = {
					{ RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
					"PopMode",
					"ExplorePwdAsync",
				},
			},
		},
		default = {
			messages = {
				{ RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
				"UpdateInputBufferFromKey",
				{ AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
				"ExplorePwdAsync",
			},
		},
	},
}

-- The builtin sort mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.sort = {
	name = "sort",
	key_bindings = {
		on_key = {
			["!"] = {
				help = "reverse sorters",
				messages = {
					"ReverseNodeSorters",
					"ExplorePwdAsync",
				},
			},
			["E"] = {
				help = "by canonical extension reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalExtension", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["M"] = {
				help = "by canonical mime essence reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalMimeEssence", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["N"] = {
				help = "by node type reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalIsDir", reverse = true } },
					{ AddNodeSorter = { sorter = "ByCanonicalIsFile", reverse = true } },
					{ AddNodeSorter = { sorter = "ByIsSymlink", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["R"] = {
				help = "by relative path reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByIRelativePath", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["S"] = {
				help = "by size reverse",
				messages = {
					{ AddNodeSorter = { sorter = "BySize", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["backspace"] = {
				help = "remove last sorter",
				messages = {
					"RemoveLastNodeSorter",
					"ExplorePwdAsync",
				},
			},
			["ctrl-r"] = {
				help = "reset sorters",
				messages = {
					"ResetNodeSorters",
					"ExplorePwdAsync",
				},
			},
			["ctrl-u"] = {
				help = "clear sorters",
				messages = {
					"ClearNodeSorters",
					"ExplorePwdAsync",
				},
			},
			["e"] = {
				help = "by canonical extension",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalExtension", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					"PopModeKeepingInputBuffer",
				},
			},
			["esc"] = {
				messages = {
					"PopModeKeepingInputBuffer",
				},
			},
			["m"] = {
				help = "by canonical mime essence",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalMimeEssence", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["n"] = {
				help = "by node type",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalIsDir", reverse = false } },
					{ AddNodeSorter = { sorter = "ByCanonicalIsFile", reverse = false } },
					{ AddNodeSorter = { sorter = "ByIsSymlink", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["r"] = {
				help = "by relative path",
				messages = {
					{ AddNodeSorter = { sorter = "ByIRelativePath", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["s"] = {
				help = "by size",
				messages = {
					{ AddNodeSorter = { sorter = "BySize", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["c"] = {
				help = "by created",
				messages = {
					{ AddNodeSorter = { sorter = "ByCreated", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["C"] = {
				help = "by created reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCreated", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["l"] = {
				help = "by last modified",
				messages = {
					{ AddNodeSorter = { sorter = "ByLastModified", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["L"] = {
				help = "by last modified reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByLastModified", reverse = true } },
					"ExplorePwdAsync",
				},
			},
		},
	},
}

-- The builtin switch layout mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.switch_layout = {
	name = "switch layout",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["1"] = {
				help = "default",
				messages = {
					{ SwitchLayoutBuiltin = "default" },
					"PopMode",
				},
			},
			["2"] = {
				help = "no help menu",
				messages = {
					{ SwitchLayoutBuiltin = "no_help" },
					"PopMode",
				},
			},
			["3"] = {
				help = "no selection panel",
				messages = {
					{ SwitchLayoutBuiltin = "no_selection" },
					"PopMode",
				},
			},
			["4"] = {
				help = "no help or selection",
				messages = {
					{ SwitchLayoutBuiltin = "no_help_no_selection" },
					"PopMode",
				},
			},
		},
	},
}

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

-- The builtin edit permissions mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.edit_permissions = {
	name = "edit permissions",
	key_bindings = {
		on_key = {
			["u"] = {
				help = "+user",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              U="$(( (${U:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["U"] = {
				help = "-user",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              U="$(( ${U:-0}-1 < 0 ? 7 : ${U:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["g"] = {
				help = "+group",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              G="$(( (${G:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["G"] = {
				help = "-group",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              G="$(( ${G:-0}-1 < 0 ? 7 : ${G:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["o"] = {
				help = "+other",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              O="$(( (${O:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["O"] = {
				help = "-other",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              O="$(( ${O:-0}-1 < 0 ? 7 : ${O:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["m"] = {
				help = "max",
				messages = {
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetInputBuffer: %q' "777"
            ]===],
					},
				},
			},
			["M"] = {
				help = "min",
				messages = {
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetInputBuffer: %q' "000"
            ]===],
					},
				},
			},
			["ctrl-r"] = {
				help = "reset",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM=$(stat -c '%a' -- "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${PERM:?}"
            ]===],
					},
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              chmod "${XPLR_INPUT_BUFFER:?}" -- "${XPLR_FOCUS_PATH:?}"
            ]===],
					},
					"PopMode",
					"ExplorePwdAsync",
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

-- This is where you define custom modes.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Mode](https://xplr.dev/en/mode)
--
-- Example:
--
-- ```lua
-- xplr.config.modes.custom.example = {
--   name = "example",
--   key_bindings = {
--     on_key = {
--       enter = {
--         help = "default mode",
--         messages = {
--           "PopMode",
--           { SwitchModeBuiltin = "default" },
--         },
--       },
--     },
--   },
-- }
--
-- xplr.config.general.initial_mode = "example"
-- ```
xplr.config.modes.custom = {}
