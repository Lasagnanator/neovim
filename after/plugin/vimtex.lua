--<< VIMTEX FILETYPE CONFIGURATION >>--

--<< Set the engine
vim.g.vimtex_compiler_latexmk_engines = {
    ["_"] = "-lualatex"
}

--<< Set the previewers
vim.g.vimtex_view_method = 'zathura_simple'

--<< For windows
-- vim.g.vimtex_view_method = 'sioyek'
-- vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
-- vim.g.vimtex_callback_progpath = 'wsl nvim'
