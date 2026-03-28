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
        current_line_blame_opts = {
            delay = 0,
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    keys = require("keybinds.plugins.gitsigns"):to_lazy(),
}
