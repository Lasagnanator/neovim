return {
    "lewis6991/gitsigns.nvim", -- Git decorations
    opts = {
        signs      = {
            add          = { text = "+" },
            change       = { text = "~" },
            delete       = { text = "-" },
            topdelete    = { text = "-" },
            changedelete = { text = "~" },
            untracked    = { text = "┆" },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    },
    keys = require("keybinds.plugins.gitsigns"):to_lazy(),
}
