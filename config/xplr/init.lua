---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
version = "0.21.5"
---@diagnostic enable

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"
package.path = package.path
	.. ";"
	.. home
	.. "/.config/xplr/config/?.lua;"
	.. home
	.. "/.config/xplr/?.lua;"
	.. home
	.. "/.config/xplr/config/modes/?.lua;"
	.. home
	.. "/.config/xplr/plugins/?.lua;"
	.. xpm_path
	.. "/?.lua;"
	.. xpm_path
	.. "/?/init.lua"

require("general")
require("modes")
require("layouts")
require("node_types")
require("functions")
-- require("config.hooks")

os.execute(string.format("[ -e '%s' ] || git clone --depth 1 '%s' '%s'", xpm_path, xpm_url, xpm_path))

require("xpm").setup({
	plugins = {
		-- Let xpm manage itself
		"dtomvan/xpm.xplr",
		-- { name = "sayanarijit/command-mode.xplr" },
		-- { name = "igorepst/context-switch.xplr" },
		-- { name = "sayanarijit/dual-pane.xplr" },
		-- { name = "sayanarijit/offline-docs.xplr" },
		-- { name = "sayanarijit/regex-search.xplr" },
		-- { name = "sayanarijit/registers.xplr" },
		-- { name = "sayanarijit/tri-pane.xplr" },
		-- { name = "sayanarijit/type-to-nav.xplr" },
		-- { name = "igorepst/term.xplr" },
		-- { name = "sayanarijit/wl-clipboard.xplr" },
		-- { name = "sayanarijit/alacritty.xplr" },
		-- { name = "sayanarijit/dragon.xplr" },
		-- { name = "sayanarijit/dua-cli.xplr" },
		-- { name = "sayanarijit/find.xplr" },
		-- { name = "Junker/nuke.xplr" },
		-- { name = "sayanarijit/nvim-ctrl.xplr" },
		-- { name = "dtomvan/ouch.xplr" },
		-- { name = "dtomvan/paste-rs.xplr" },
		-- { name = "sayanarijit/preview-tabbed.xplr" },
		-- { name = "sayanarijit/qrcp.xplr" },
		-- { name = "sayanarijit/scp.xplr" },
		-- { name = "sayanarijit/trash-cli.xplr" },
		-- { name = "sayanarijit/xargs.xplr" },
		-- { name = "sayanarijit/xclip.xplr" },
		-- { name = "sayanarijit/zoxide.xplr" },
		{ name = "sayanarijit/fzf.xplr" },
		-- { name = "sayanarijit/map.xplr" },
		-- { name = "sayanarijit/material-landscape.xplr" },
		-- { name = "sayanarijit/material-landscape2.xplr" },
		-- { name = "sayanarijit/zentable.xplr" },
		{ name = "prncss-xyz/icons.xplr" },
		{ name = "dtomvan/extra-icons.xplr" },
		{ name = "sayanarijit/map.xplr" },
		-- { name = "sayanarijit/tree-view.xplr" },
		{},
	},
	auto_install = true,
	auto_cleanup = false,
})

xplr.config.modes.builtin.default.key_bindings.on_key.x = {
	help = "xpm",
	messages = {
		"PopMode",
		{ SwitchModeCustom = "xpm" },
	},
}

-- Custom Commands: 'open'
xplr.config.modes.builtin.go_to.key_bindings.on_key.x = {
	help = "open in gui",
	messages = {
		{
			BashExecSilently0 = [===[
              if [ -z "$OPENER" ]; then
                if command -v define-app; then
                  OPENER="define-app -a -r"
                elif command -v xdg-open; then
                  OPENER=xdg-open
                elif command -v mimeopen; then
                  OPENER="mimeopen -n"
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
}

xplr.config.modes.builtin.default.key_bindings.on_key.enter = xplr.config.modes.builtin.go_to.key_bindings.on_key.x

-- require("tri-pane").setup({
-- 	layout_key = "T", -- In switch_layout mode
-- 	as_default_layout = true,
-- 	left_pane_width = { Percentage = 20 },
-- 	middle_pane_width = { Percentage = 50 },
-- 	right_pane_width = { Percentage = 30 },
-- 	left_pane_renderer = custom_function_to_render_left_pane,
-- 	right_pane_renderer = custom_function_to_render_right_pane,
-- })

require("zentable").setup()

require("fzf").setup()
require("icons").setup()
require("extra-icons").setup()

require("tree-view").setup({
	mode = "switch_layout",
	key = "T",

	-- If you feel slowness, you might want to toggle back to the default view.
	toggle_layout_mode = "default",
	toggle_layout_key = "esc",

	-- Press backspace to close all and back and close
	close_all_and_back_mode = "default",
	close_all_and_back_key = "backspace",

	-- Toggle expansion without entering
	toggle_expansion_mode = "default",
	toggle_expansion_key = "o",

	-- Toggle expansion of all the nodes under pwd
	toggle_expansion_all_mode = "default",
	toggle_expansion_all_key = "O",

	-- Focus on the next visible line, not compatible with up/down action
	focus_next_mode = "default",
	focus_next_key = "]",

	-- Focus on the previous visible line, not compatible with up/down action
	focus_prev_mode = "default",
	focus_prev_key = "[",

	-- Go to the next deep level directory that's open
	goto_next_open_mode = "default",
	goto_next_open_key = ")",

	-- Go to the previous deep level directory that's open
	goto_prev_open_mode = "default",
	goto_prev_open_key = "(",

	-- Whether to display the tree in full screen
	fullscreen = false,

	-- Indent for the branches of the tree
	indent = "  ",

	-- Start xplr with tree view layout
	as_initial_layout = false,

	-- Disables toggling layout.
	as_default_layout = false,

	-- Automatically fallback to this layout for better performance if the
	-- branch contains # of nodes more than the threshold value
	fallback_layout = "Table",
	fallback_threshold = 500, -- default: nil (disabled)
})

local function stat(node)
	return xplr.util.to_yaml(xplr.util.node(node.absolute_path))
end

local function read(path, height)
	local p = io.open(path)

	if p == nil then
		return nil
	end

	local i = 0
	local res = ""
	for line in p:lines() do
		if line:match("[^ -~\n\t]") then
			p:close()
			return
		end

		res = res .. line .. "\n"
		if i == height then
			break
		end
		i = i + 1
	end
	p:close()

	return res
end

xplr.fn.custom.preview_pane = {}
xplr.fn.custom.preview_pane.render = function(ctx)
	local title = nil
	local body = ""
	local n = ctx.app.focused_node
	if n and n.canonical then
		n = n.canonical
	end

	if n then
		title = { format = n.absolute_path, style = xplr.util.lscolor(n.absolute_path) }
		if n.is_file then
			body = read(n.absolute_path, ctx.layout_size.height) or stat(n)
		end
	end

	return { CustomParagraph = { ui = { title = title }, body = body } }
end

local preview_pane = { Dynamic = "custom.preview_pane.render" }
local split_preview = {
	Horizontal = {
		config = {
			constraints = {
				{ Percentage = 60 },
				{ Percentage = 40 },
			},
		},
		splits = {
			"Table",
			preview_pane,
		},
	},
}

xplr.config.layouts.builtin.default =
	xplr.util.layout_replace(xplr.config.layouts.builtin.default, "Table", split_preview)
