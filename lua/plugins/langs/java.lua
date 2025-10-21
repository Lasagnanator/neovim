if not Langs.java then
	return {}
end

---@type LazySpec
return {
	"nvim-java/nvim-java",
	version = "*",
	config = function()
		local utils = require("core.utils")

		require("java").setup({
			jdk = {
				auto_install = false,
			},
		})

		require("lspconfig").jdtls.setup({
			on_attach = utils.on_attach,
			capabilities = utils.set_capabilities(),
		})
	end,
	dependencies = { "mfussenegger/nvim-dap" },
}
