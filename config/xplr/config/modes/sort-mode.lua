---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

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
