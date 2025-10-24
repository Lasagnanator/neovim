if not Langs.latex then return {} end

return {
    "lervag/vimtex",
    version = "*",
    init = function()
        if vim.fn.has("wsl") == 1 then
            vim.g.vimtex_view_method = "sioyek"
            vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
            vim.g.vimtex_callback_progpath = "wsl nvim"
        else
            vim.g.vimtex_view_method = "zathura_simple"
        end
    end,
    lazy = false,
}
