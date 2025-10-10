if not Langs.go then
	return {}
end

Treesitter:update({ "go", "gomod", "gosum", "gotmpl", "gowork" })
Mason:update({ "gopls", "delve", "gofumpt", "gomodifytags", "goimports", "impl" })

vim.lsp.enable("gopls")
-- XXX: experimental, to be tested
require("conform").formatters_by_ft.go = { "gofumpt", "gomodifytags", "goimports" }

---@type LazySpec
return {
	{
		"ray-x/go.nvim",
		opts = {
			lsp_cfg = false,
			lsp_inlay_hints = {
				enable = false,
			},
		},
		ft = { "go", "gomod", "gosum", "gotmpl", "gowork" },
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"leoluz/nvim-dap-go",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
}
