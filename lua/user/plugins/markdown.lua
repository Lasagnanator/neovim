return {
    {
        "iamcco/markdown-preview.nvim", -- Preview markdown files in browser
        build = "app/install.sh",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "lervag/vimtex", -- LaTeX utils
        init = function()
            vim.g.vimtex_compiler_latexmk_engines = {
                ["_"] = "-lualatex"
            }
            vim.g.vimtex_view_method = 'zathura_simple'
            -- Windows
            -- vim.g.vimtex_view_method = 'sioyek'
            -- vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
            -- vim.g.vimtex_callback_progpath = 'wsl nvim'
        end,
    },
}
