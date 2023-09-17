return {
    {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        -- TODO: set priority
        opts = {
            ensure_installed = { "lua", "bash" },
            highlight = {
                enable = true,
                disable = { "yaml.ansible", "tex" },
            },
        },
    },
    {
        "nvim-treesitter/playground", -- Treesitter informations in Neovim
        lazy = true,
    },
    {
        "nvim-treesitter/nvim-treesitter-context", -- Shows which function are you editing on the first line of the screen
        config = true
    },
}
