---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

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
