---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ### Node Types -------------------------------------------------------------
--
-- This section defines how to deal with different kinds of nodes (files,
-- directories, symlinks etc.) based on their properties.
--
-- One node can fall into multiple categories. For example, a node can have the
-- *extension* `md`, and also be a *file*. In that case, the properties from
-- the more  specific category i.e. *extension* will be used.
--
-- This can be configured using the `xplr.config.node_types` Lua API.

-- The style for the directory nodes
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.node_types.directory.style = {}

-- Metadata for the directory nodes.
-- You can set as many metadata as you want.
--
-- Type: nullable string
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.directory.meta.foo = "foo"
-- xplr.config.node_types.directory.meta.bar = "bar"
-- ```
xplr.config.node_types.directory.meta.icon = "ð"

-- The style for the file nodes.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.node_types.file.style = {}

-- Metadata for the file nodes.
-- You can set as many metadata as you want.
--
-- Type: nullable string
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.file.meta.foo = "foo"
-- xplr.config.node_types.file.meta.bar = "bar"
-- ```
xplr.config.node_types.file.meta.icon = "ƒ"

-- The style for the symlink nodes.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.node_types.symlink.style = {}

-- Metadata for the symlink nodes.
-- You can set as many metadata as you want.
--
-- Type: nullable string
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.symlink.meta.foo = "foo"
-- xplr.config.node_types.symlink.meta.bar = "bar"
-- ```
xplr.config.node_types.symlink.meta.icon = "§"

-- Metadata and style based on mime types.
-- It is possible to use the wildcard `*` to match all mime sub types. It will
-- be overwritten by the more specific sub types that are defined.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value:
--   * key: string
--   * value: [Node Type](https://xplr.dev/en/node-type)
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.mime_essence = {
--   application = {
--     -- application/*
--     ["*"] = { meta = { icon = "a" } },
--
--     -- application/pdf
--     pdf = { meta = { icon = "" }, style = { fg = "Blue" } },
--
--     -- application/zip
--     zip = { meta = { icon = ""} },
--   },
-- }
-- ```
xplr.config.node_types.mime_essence = {}

-- Metadata and style based on extension.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Node Type](https://xplr.dev/en/node-type)
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.extension.md = { meta = { icon = "" }, style = { fg = "Blue" } }
-- xplr.config.node_types.extension.rs = { meta = { icon = "🦀" } }
-- ```
xplr.config.node_types.extension = {}

-- Metadata and style based on special file names.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Node Type](https://xplr.dev/en/node-type)
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.special["Cargo.toml"] = { meta = { icon = "" } }
-- xplr.config.node_types.special["Downloads"] = { meta = { icon = "" }, style = { fg = "Blue" } }
-- ```
xplr.config.node_types.special = {}

-- ### Layouts ----------------------------------------------------------------
--
-- xplr layouts define the structure of the UI, i.e. how many panel we see,
-- placement and size of the panels, how they look etc.
--
-- This is configuration exposed via the `xplr.config.layouts` API.
--
-- `xplr.config.layouts.builtin` contain some built-in panels which can be
-- overridden, but you can't add or remove panels in it.
--
-- You can add new panels in `xplr.config.layouts.custom`.
--
-- ##### Example: Defining Custom Layout
--
-- ```lua
-- xplr.config.layouts.builtin.default = {
--   Horizontal = {
--     config = {
--       margin = 1,
--       horizontal_margin = 1,
--       vertical_margin = 1,
--       constraints = {
--         { Percentage = 50 },
--         { Percentage = 50 },
--       }
--     },
--     splits = {
--       "Table",
--       "HelpMenu",
--     }
--   }
-- }
-- ```
--
-- Result:
--
-- ```
-- ╭ /home ─────────────╮╭ Help [default] ────╮
-- │   ╭─── path        ││.    show hidden    │
-- │   ├▸[ð Desktop/]   ││/    search         │
-- │   ├  ð Documents/  ││:    action         │
-- │   ├  ð Downloads/  ││?    global help    │
-- │   ├  ð GitHub/     ││G    go to bottom   │
-- │   ├  ð Music/      ││V    select/unselect│
-- │   ├  ð Pictures/   ││ctrl duplicate as   │
-- │   ├  ð Public/     ││ctrl next visit     │
-- ╰────────────────────╯╰────────────────────╯
-- ```
