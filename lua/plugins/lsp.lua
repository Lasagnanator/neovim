---@type LazySpec
return {
	"neovim/nvim-lspconfig",
	version = "*",
	config = function()
		local utils = require("core.utils")
		vim.lsp.config("*", {
			on_attach = utils.on_attach,
			capabilities = utils.set_capabilities(),
		})
	end,
}
