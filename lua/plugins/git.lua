local Utils = require("core.utils")

return {
    {
        "tpope/vim-fugitive", -- Git tools inside neovim
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "ibhagwan/fzf-lua",
        },
        config = true
    },
    {
        "lewis6991/gitsigns.nvim", -- Git decorations
        opts = {
            signs = {
                add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                change = {
                    hl = "GitSignsChange",
                    text = "~",
                    numhl = "GitSignsChangeNr",
                    linehl =
                    "GitSignsChangeLn"
                },
                delete = {
                    hl = "GitSignsDelete",
                    text = "-",
                    numhl = "GitSignsDeleteNr",
                    linehl =
                    "GitSignsDeleteLn"
                },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "-",
                    numhl = "GitSignsDeleteNr",
                    linehl =
                    "GitSignsDeleteLn"
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = "~",
                    numhl = "GitSignsChangeNr",
                    linehl =
                    "GitSignsChangeLn"
                },
                untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        },
        init = function()
            Utils.set_keybinds(Keybinds.gitsigns().common)
        end,
    },
    {
        "sindrets/diffview.nvim", -- Viewer for diffs and merge resolution
        config = function()
            local diffview = require("diffview")
            diffview.setup({
                enhanced_diff_hl = true,
                view = {
                    default = { layout = 'diff2_horizontal' },
                    merge_tool = {
                        layout = 'diff3_mixed',
                        disable_diagnostics = true,
                    },
                },
                keymaps = {
                    disable_defaults = false, -- Disable the default keymaps
                    view = Utils.index_keybinds(Keybinds.diffview().view),
                },
            })
        end,
        init = function()
            Utils.set_keybinds(Keybinds.diffview().common)
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    },
    -- TODO: check which git plugins are really needed
}
