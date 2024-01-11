---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

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

-- The builtin default mode.
-- Visit the [Default Key Bindings](https://xplr.dev/en/default-key-bindings)
-- to see what each mode does.
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
