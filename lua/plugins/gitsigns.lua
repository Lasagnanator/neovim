---@type LazySpec
return {
    "lewis6991/gitsigns.nvim",
    branch = "main",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "-" },
            topdelete = { text = "-" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
    },
    event = { "BufReadPre", "BufNewFile" },
    keys = require("keybinds.plugins.gitsigns"):to_lazy(),
}
