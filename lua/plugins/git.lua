local Utils = require("core.utils")

return {
    {
        -- TODO: evaluate, since I've not used in a year
        "tpope/vim-fugitive", -- Git tools inside neovim
    },
    {
        "NeogitOrg/neogit",
        -- TODO: enable with nvim 0.10
        enabled = false,
        config = true,
        init = function()
            require("keybinds.plugins.neogit"):set()
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "ibhagwan/fzf-lua",
        }
    },
    {
        "lewis6991/gitsigns.nvim", -- Git decorations
        opts = {
            signs = {
                add          = { hl = "GitSignsAdd",    text = "+", numhl = "GitSignsAddNr",    linehl = "GitSignsAddLn" },
                change       = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                delete       = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                topdelete    = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                untracked    = { hl = "GitSignsAdd",    text = "┆", numhl = "GitSignsAddNr",    linehl = "GitSignsAddLn" },
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        },
        init = function()
            require("keybinds.plugins.gitsigns"):set()
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
                    view = require("keybinds.plugins.diffview").view:to_list()
                },
            })
            require("keybinds.plugins.diffview").global:set()
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    },
}
