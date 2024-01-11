---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The default layout
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.default = {
	Horizontal = {
		config = {
			constraints = {
				{ Percentage = 70 },
				{ Percentage = 30 },
			},
		},
		splits = {
			{
				Vertical = {
					config = {
						constraints = {
							{ Length = 3 },
							{ Min = 1 },
							{ Length = 3 },
						},
					},
					splits = {
						"SortAndFilter",
						"Table",
						"InputAndLogs",
					},
				},
			},
			{
				Vertical = {
					config = {
						constraints = {
							{ Percentage = 30 },
							{ Percentage = 70 },
						},
					},
					splits = {
						"Selection",
						"HelpMenu",
					},
				},
			},
		},
	},
}

-- The layout without help menu
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.no_help = {
	Horizontal = {
		config = {
			constraints = {
				{ Percentage = 70 },
				{ Percentage = 30 },
			},
		},
		splits = {
			{
				Vertical = {
					config = {
						constraints = {
							{ Length = 3 },
							{ Min = 1 },
							{ Length = 3 },
						},
					},
					splits = {
						"SortAndFilter",
						"Table",
						"InputAndLogs",
					},
				},
			},
			"Selection",
		},
	},
}

-- The layout without selection panel
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.no_selection = {
	Horizontal = {
		config = {
			constraints = {
				{ Percentage = 70 },
				{ Percentage = 30 },
			},
		},
		splits = {
			{
				Vertical = {
					config = {
						constraints = {
							{ Length = 3 },
							{ Min = 1 },
							{ Length = 3 },
						},
					},
					splits = {
						"SortAndFilter",
						"Table",
						"InputAndLogs",
					},
				},
			},
			"HelpMenu",
		},
	},
}

-- The layout without help menu and selection panel
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.no_help_no_selection = {
	Vertical = {
		config = {
			constraints = {
				{ Length = 3 },
				{ Min = 1 },
				{ Length = 3 },
			},
		},
		splits = {
			"SortAndFilter",
			"Table",
			"InputAndLogs",
		},
	},
}

-- This is where you can define custom layouts
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Layout](https://xplr.dev/en/layout)
--
-- Example:
--
-- ```lua
-- xplr.config.layouts.custom.example = "Nothing" -- Show a blank screen
-- xplr.config.general.initial_layout = "example" -- Load the example layout
-- ```
xplr.config.layouts.custom = {}
