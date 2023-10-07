return {
    {
        "tpope/vim-fugitive", -- Git tools inside neovim
    },
    {
        "lewis6991/gitsigns.nvim", -- Git decorations
        opts = {
            signs      = {
                add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                change       = {
                    hl = 'GitSignsChange',
                    text = '~',
                    numhl = 'GitSignsChangeNr',
                    linehl =
                    'GitSignsChangeLn'
                },
                delete       = {
                    hl = 'GitSignsDelete',
                    text = '-',
                    numhl = 'GitSignsDeleteNr',
                    linehl =
                    'GitSignsDeleteLn'
                },
                topdelete    = {
                    hl = 'GitSignsDelete',
                    text = '-',
                    numhl = 'GitSignsDeleteNr',
                    linehl =
                    'GitSignsDeleteLn'
                },
                changedelete = {
                    hl = 'GitSignsChange',
                    text = '~',
                    numhl = 'GitSignsChangeNr',
                    linehl =
                    'GitSignsChangeLn'
                },
                untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        },
        init = function()
            vim.keymap.set("n", "<Leader>gss", "<CMD>Gitsigns toggle_signs<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>gsn", "<CMD>Gitsigns toggle_numhl<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>gsl", "<CMD>Gitsigns toggle_linehl<CR>", { noremap = true, silent = true })
        end,
    },
    {
        -- TODO: useful?
        "sindrets/diffview.nvim", -- Viewer for diffs and merge resolution
        config = function()
            local diffview = require("diffview")
            local actions = require("diffview.actions")
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
                    view = {
                        -- The `view` bindings are active in the diff buffers, only when the current
                        -- tabpage is a Diffview.
                        { 'n', '<tab>', actions.select_next_entry, {
                            desc =
                            'Open the diff for the next file'
                        } },
                        { 'n', '<s-tab>', actions.select_prev_entry, {
                            desc =
                            'Open the diff for the previous file'
                        } },
                        { 'n', '<C-t>',      actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
                        { 'n', '<Leader>ew', actions.focus_files,   { desc = 'Bring focus to the file panel' } },
                        { 'n', '<Leader>ee', actions.toggle_files,  { desc = 'Toggle the file panel.' } },
                        -- { 'n', 'g<C-x>',     actions.cycle_layout,              { desc = 'Cycle through available layouts.' } },
                        { 'n', '<Leader>k', actions.prev_conflict,
                            {
                                desc =
                                'In the merge-tool: jump to the previous conflict'
                            } },
                        { 'n', '<Leader>j', actions.next_conflict,
                            {
                                desc =
                                'In the merge-tool: jump to the next conflict'
                            } },
                        { 'n', '<Leader>co', actions.conflict_choose('ours'),
                            {
                                desc =
                                'Choose the OURS version of a conflict'
                            } },
                        { 'n', '<Leader>ct', actions.conflict_choose('theirs'),
                            {
                                desc =
                                'Choose the THEIRS version of a conflict'
                            } },
                        { 'n', '<Leader>cb', actions.conflict_choose('base'),
                            {
                                desc =
                                'Choose the BASE version of a conflict'
                            } },
                        { 'n', '<Leader>ca', actions.conflict_choose('all'),
                            {
                                desc =
                                'Choose all the versions of a conflict'
                            } },
                        { 'n', 'dx', actions.conflict_choose('none'), { desc = 'Delete the conflict region' } },
                    },
                },
            })
        end,
        init = function()
            vim.keymap.set('n', '<Leader>lf', '<Cmd>DiffviewOpen<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>lhd', '<Cmd>DiffviewFileHistory<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>lhf', '<Cmd>DiffviewFileHistory %<CR>', { noremap = true, silent = true })
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    },
    --TODO: check which git plugins are really needed
}
