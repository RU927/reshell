---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ## Function ----------------------------------------------------------------
--
-- While `xplr.config` defines all the static parts of the configuration,
-- `xplr.fn` defines all the dynamic parts using functions.
--
-- See: [Lua Function Calls](https://xplr.dev/en/lua-function-calls)
--
-- As always, `xplr.fn.builtin` is where the built-in functions are defined
-- that can be overwritten.

-- Tries to auto complete the path in the input buffer
xplr.fn.builtin.try_complete_path = function(m)
	if not m.input_buffer then
		return
	end

	local function matches_all(str, paths)
		for _, path in ipairs(paths) do
			if string.sub(path, 1, #str) ~= str then
				return false
			end
		end
		return true
	end

	local path = m.input_buffer
	local explorer_config = {
		filters = {
			{ filter = "RelativePathDoesStartWith", input = xplr.util.basename(path) },
		},
	}
	local parent = xplr.util.dirname(path)
	if not parent or parent == "" then
		parent = "./"
	elseif parent ~= "/" then
		parent = parent .. "/"
	end

	local nodes = xplr.util.explore(parent, explorer_config)
	local found = {}
	for _, node in ipairs(nodes) do
		table.insert(found, parent .. node.relative_path)
	end
	local count = #found

	if count == 0 then
		return
	elseif count == 1 then
		return {
			{ SetInputBuffer = found[1] },
		}
	else
		local first = found[1]
		while #first > #path and matches_all(path, found) do
			path = string.sub(first, 1, #path + 1)
		end

		if matches_all(path, found) then
			return {
				{ SetInputBuffer = path },
			}
		end

		return {
			{ SetInputBuffer = string.sub(path, 1, #path - 1) },
		}
	end
end

xplr.fn.builtin.fmt_general_selection_item = function(n)
	local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
	local sh_config = { with_prefix_dots = true, without_suffix_dots = true }
	local shortened = xplr.util.shorten(n.absolute_path, sh_config)
	if n.is_dir then
		shortened = shortened .. "/"
	end
	local ls_style = xplr.util.lscolor(n.absolute_path)
	local meta_style = xplr.util.node_type(n).style
	local style = xplr.util.style_mix({ ls_style, meta_style })
	return xplr.util.paint(shortened:gsub("\n", nl), style)
end

-- Renders the first column in the table
xplr.fn.builtin.fmt_general_table_row_cols_0 = function(m)
	local r = ""
	if m.is_before_focus then
		r = r .. " -"
	else
		r = r .. "  "
	end

	r = r .. m.relative_index .. "│" .. m.index

	return r
end

-- Renders the second column in the table
xplr.fn.builtin.fmt_general_table_row_cols_1 = function(m)
	local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
	local r = m.tree .. m.prefix
	local style = xplr.util.lscolor(m.absolute_path)
	style = xplr.util.style_mix({ style, m.style })

	if m.meta.icon == nil then
		r = r .. ""
	else
		r = r .. m.meta.icon .. " "
	end

	local rel = m.relative_path
	if m.is_dir then
		rel = rel .. "/"
	end
	r = r .. xplr.util.paint(xplr.util.shell_escape(rel), style)

	r = r .. m.suffix .. " "

	if m.is_symlink then
		r = r .. "-> "

		if m.is_broken then
			r = r .. "×"
		else
			local symlink_path = xplr.util.shorten(m.symlink.absolute_path, { base = m.parent })
			if m.symlink.is_dir then
				symlink_path = symlink_path .. "/"
			end
			r = r .. symlink_path:gsub("\n", nl)
		end
	end

	return r
end

-- Renders the third column in the table
xplr.fn.builtin.fmt_general_table_row_cols_2 = function(m)
	local r = xplr.util.paint("r", { fg = "Green" })
	local w = xplr.util.paint("w", { fg = "Yellow" })
	local x = xplr.util.paint("x", { fg = "Red" })
	local s = xplr.util.paint("s", { fg = "Red" })
	local S = xplr.util.paint("S", { fg = "Red" })
	local t = xplr.util.paint("t", { fg = "Red" })
	local T = xplr.util.paint("T", { fg = "Red" })

	return xplr.util
		.permissions_rwx(m.permissions)
		:gsub("r", r)
		:gsub("w", w)
		:gsub("x", x)
		:gsub("s", s)
		:gsub("S", S)
		:gsub("t", t)
		:gsub("T", T)
end

-- Renders the fourth column in the table
xplr.fn.builtin.fmt_general_table_row_cols_3 = function(m)
	if not m.is_dir then
		return m.human_size
	else
		return ""
	end
end

-- Renders the fifth column in the table
xplr.fn.builtin.fmt_general_table_row_cols_4 = function(m)
	return tostring(os.date("%a %b %d %H:%M:%S %Y", m.last_modified / 1000000000))
end

-- This is where the custom functions can be added.
--
-- There is currently no restriction on what kind of functions can be defined
-- in `xplr.fn.custom`.
--
-- You can also use nested tables such as
-- `xplr.fn.custom.my_plugin.my_function` to define custom functions.
xplr.fn.custom = {}
