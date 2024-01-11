---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin duplicate as mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.duplicate_as = {
	name = "duplicate as",
	key_bindings = {
		on_key = {
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              SRC="${XPLR_FOCUS_PATH:?}"
              SRC_ESC=$(printf %q "$SRC")
              TARGET="${XPLR_INPUT_BUFFER:?}"
              TARGET_ESC=$(printf %q "$TARGET")
              if [ -e "${TARGET:?}" ]; then
                "$XPLR" -m 'LogError: %q' "$TARGET_ESC already exists"
              else
                cp -r -- "${SRC:?}" "${TARGET:?}" \
                  && "$XPLR" -m ExplorePwd \
                  && "$XPLR" -m 'FocusPath: %q' "$TARGET_ESC" \
                  && "$XPLR" -m 'LogSuccess: %q' "$SRC_ESC duplicated as $TARGET_ESC"
              fi
            ]===],
					},
					"PopMode",
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
