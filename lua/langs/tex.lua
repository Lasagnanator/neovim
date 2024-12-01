if not Langs.tex.enabled then return {} end

return {
    {
        "lervag/vimtex",
        ft = { "tex" },
        init = function()
            vim.g.vimtex_compiler_latexmk_engines = {
                ["_"] = "-lualatex"
            }
            if vim.fn.has("wsl") == 1 then
                vim.g.vimtex_view_method = 'sioyek'
                vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
                vim.g.vimtex_callback_progpath = 'wsl nvim'
            else
                vim.g.vimtex_view_method = 'zathura_simple'
            end
        end,
    },
}
