---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- The builtin edit permissions mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.edit_permissions = {
	name = "edit permissions",
	key_bindings = {
		on_key = {
			["u"] = {
				help = "+user",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              U="$(( (${U:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["U"] = {
				help = "-user",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              U="$(( ${U:-0}-1 < 0 ? 7 : ${U:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["g"] = {
				help = "+group",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              G="$(( (${G:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["G"] = {
				help = "-group",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              G="$(( ${G:-0}-1 < 0 ? 7 : ${G:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["o"] = {
				help = "+other",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              O="$(( (${O:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["O"] = {
				help = "-other",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"

              O="$(( ${O:-0}-1 < 0 ? 7 : ${O:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
					},
				},
			},
			["m"] = {
				help = "max",
				messages = {
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetInputBuffer: %q' "777"
            ]===],
					},
				},
			},
			["M"] = {
				help = "min",
				messages = {
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetInputBuffer: %q' "000"
            ]===],
					},
				},
			},
			["ctrl-r"] = {
				help = "reset",
				messages = {
					{
						BashExecSilently0 = [===[
              PERM=$(stat -c '%a' -- "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${PERM:?}"
            ]===],
					},
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              chmod "${XPLR_INPUT_BUFFER:?}" -- "${XPLR_FOCUS_PATH:?}"
            ]===],
					},
					"PopMode",
					"ExplorePwdAsync",
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
