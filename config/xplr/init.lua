---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- This is the built-in configuration file that gets loaded and sets the
-- default values when xplr loads, before loading any other custom
-- configuration file.
--
-- You can use this file as a reference to create a your custom config file.
--
-- To create a custom configuration file, you need to define the script version
-- for compatibility checks.
--
-- See https://xplr.dev/en/upgrade-guide
--
-- ```lua
version = "0.21.5"
-- ```

require("config.general")
require("config.modes")
require("config.layouts")
require("config.node_types")
require("config.functions")
require("config.hooks")

-- ----------------------------------------------------------------------------
-- > Note:
-- >
-- > It's not recommended to copy the entire configuration, unless you want to
-- > freeze it and miss out on useful updates to the defaults.
-- >
-- > Instead, you can use this as a reference to overwrite only the parts you
-- > want to update.
-- >
-- > If you still want to copy the entire configuration, make sure to put your
-- > customization before the return statement.
