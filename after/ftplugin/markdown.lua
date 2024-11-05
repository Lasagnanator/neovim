--<< MARKDOWN FILETYPE CONFIG >>--

--<< Settings
vim.opt_local["wrap"] = true
vim.opt_local["linebreak"] = true
vim.opt_local["breakindent"] = true

--<< Keybinds
if Langs.markdown.enabled then require("keybinds.filetypes.markdown").filetype:bufset() end
