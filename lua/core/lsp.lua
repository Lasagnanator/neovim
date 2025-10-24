--<< Settings
vim.lsp.inlay_hint.enable(true)

--<< Autocommand
local au_lsp = vim.api.nvim_create_augroup("lsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Attach keybinds and set options when an LSP attacches to a buffer",
	group = au_lsp,
	callback = function(args)
		local bufnr = args.buf
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		require("keybinds.plugins.lsp").on_attach(bufopts):set()
	end,
})
