---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ## Hooks -------------------------------------------------------------------
--
-- This section of the configuration cannot be overwritten by another config
-- file or plugin, since this is an optional lua return statement specific to
-- each config file. It can be used to define things that should be explicit
-- for reasons like performance concerns, such as hooks.
--
-- Plugins should expose the hooks, and require users to subscribe to them
-- explicitly.
--
-- Example:
--
-- ```lua
-- return {
--   -- Add messages to send when the xplr loads.
--   -- This is similar to the `--on-load` command-line option.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_load = {
--     { LogSuccess = "Configuration successfully loaded!" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_load" },
--   },
--
--   -- Add messages to send when the directory changes.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_directory_change = {
--     { LogSuccess = "Changed directory" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_directory_change" },
--   },
--
--   -- Add messages to send when the focus changes.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_focus_change = {
--     { LogSuccess = "Changed focus" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_focus_change" },
--   }
--
--   -- Add messages to send when the mode is switched.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_mode_switch = {
--     { LogSuccess = "Switched mode" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_mode_switch" },
--   }
--
--   -- Add messages to send when the layout is switched
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_layout_switch = {
--     { LogSuccess = "Switched layout" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_layout_switch" },
--   }
--
--   -- Add messages to send when the selection changes
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_selection_change = {
--     { LogSuccess = "Selection changed" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_selection_change" },
--   }
-- }
-- ```

return {
	on_load = {},
	on_directory_change = {},
	on_focus_change = {},
	on_mode_switch = {},
	on_layout_switch = {},
}
