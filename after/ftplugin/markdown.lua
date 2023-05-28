--<< MARKDOWN FILETYPE CONFIG >>--

--<< Settings
vim.opt["wrap"] = true
vim.opt["linebreak"] = true
vim.opt["breakindent"] = true

--<< Keybinds
vim.keymap.set( "", "<Leader>lql", "<Cmd>Glow<CR>",                  { noremap = true, silent = true, buffer = true } )
vim.keymap.set( "", "<Leader>lqb", "<Cmd>MarkdownPreviewToggle<CR>", { noremap = true, silent = true, buffer = true } )
