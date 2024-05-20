return {
    "lewis6991/gitsigns.nvim",     -- Git decorations
    opts = {
        signs      = {
            add          = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            change       = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            delete       = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            topdelete    = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            untracked    = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        },
        signcolumn = true,      -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false,     -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false,     -- Toggle with `:Gitsigns toggle_word_diff`
    },
    init = function()
        require("keybinds.plugins.gitsigns"):set()
    end,
}
