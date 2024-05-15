--<< MARKDOWN FILETYPE CONFIG >>--

--<< Settings
vim.opt_local["wrap"] = true
vim.opt_local["linebreak"] = true
vim.opt_local["breakindent"] = true

--<< Keybinds
-- vim.keymap.set( "", "<Leader>mg", "<Cmd>Glow<CR>",                  { noremap = true, silent = true, buffer = true } )
vim.keymap.set( "", "<Leader>mp", "<Cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview", noremap = true, silent = true, buffer = true } )
