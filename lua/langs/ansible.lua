Mason:update({ "ansible-language-server", "ansible-lint" })
vim.lsp.enable("ansiblels")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufRead" }, {
	pattern = { "*.yml", "*.yaml", "*.ansible" },
	callback = function(args)
		if vim.api.nvim_get_option_value("ft", { buf = args.buf }) == "yaml.ansible" then
			vim.treesitter.stop()
		end
	end,
})
