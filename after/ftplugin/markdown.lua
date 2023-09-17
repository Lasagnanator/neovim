--<< MARKDOWN FILETYPE CONFIG >>--

--<< Settings
vim.opt_local["wrap"] = true
vim.opt_local["linebreak"] = true
vim.opt_local["breakindent"] = true

--<< Keybinds
vim.keymap.set( "", "<Leader>lql", "<Cmd>Glow<CR>",                  { noremap = true, silent = true, buffer = true } )
vim.keymap.set( "", "<Leader>lqb", "<Cmd>MarkdownPreviewToggle<CR>", { noremap = true, silent = true, buffer = true } )
