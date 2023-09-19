return {
    {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        priority = Priority.treesitter,
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = { "lua", "bash" },
            highlight = {
                enable = true,
                disable = { "yaml.ansible", "tex" },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context", -- Shows which function are you editing on the first line of the screen
        config = true
    },
}
