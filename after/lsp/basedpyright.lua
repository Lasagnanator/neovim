return {
    on_attach = require("core.utils").on_attach,
    capabilities = require("core.utils").set_capabilities(),
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "recommended",
			},
		},
	},
}
