---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ### Modes ------------------------------------------------------------------
--
-- xplr - это модульный файловый проводник. Это означает, что пользователи
-- могут переключаться между разными режимами, каждый из которых содержит
-- свой набор привязок клавиш, чтобы избежать столкновений.
-- Пользователи могут переключаться между этими режимами во время выполнения программы.
--
-- Режимы могут быть настроены с помощью Lua API `xplr.config.modes`.
--
-- `xplr.config.modes.builtin` содержит некоторые встроенные режимы, которые могут быть
-- переопределены, но вы не можете добавить или удалить режимы в нем.

-- local home = os.getenv("HOME")

---- Custom
xplr.config.modes.custom = {
	["git"] = require("git-mode").toplevel_mode,
	["git add"] = require("git-mode").add_mode,
}
---- Builtin
require("action-mode")
require("create-directory-mode")
require("create-file-mode")
require("create-mode")
-- require "custom-mode"
require("debug-error-mode")
require("default-mode")
require("delete-mode")
require("duplicateas-mode")
require("edit-permissions-mode")
require("filter-mode")
require("git-mode")
require("goto-mode")
require("goto-path-mode")
require("number-mode")
require("quit-mode")
require("recover-mode")
require("relative-path-does-match-regex")
require("relative-path-does-not-match-regex")
require("rename-mode")
require("search-mode")
require("selection-ops-mode")
require("sort-mode")
require("switch-layout-mode")
require("vroot-mode")
