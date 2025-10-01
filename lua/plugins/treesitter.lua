---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    priority = Priority.treesitter,
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
        ensure_installed = Treesitter.parsers,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = require("keybinds.plugins.treesitter").incremental_selection,
        },
    },
}
