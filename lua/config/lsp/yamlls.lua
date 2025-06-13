return {
	cmd = { 'yaml-language-server', '--stdio' },
	settings = {
		redhat = {
			telemetry = {
				enabled = false
			}
		},
		yaml = {
			shemaStore = {
				enabled = true,
			},
			customTags = {
				"!reference sequence",
			}
		}
	},
	filetypes = { 'yaml', 'yml' }
}
