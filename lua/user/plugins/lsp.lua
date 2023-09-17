return {
    {
        "neovim/nvim-lspconfig", -- Defaults for LSP
        priority = 100,
        dependencies = {
            { import = "user.plugins.lsp.mason"},
            { import = "user.plugins.lsp.null-ls" },
            {
                "ray-x/lsp_signature.nvim",
                opts = {
                    doc_lines            = 0,
                    toggle_key           = "<C-0>",
                    select_signature_key = "<A-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
                    move_cursor_key      = "<A-m>", -- imap, use nvim_set_current_win to move cursor between current win and floating
                    max_height           = 5,       -- max height of signature floating_window
                    max_width            = 80,      -- max_width of signature floating_window
                    hint_enable          = false,
                    hint_prefix          = "Hint: ",
                    bind                 = true,
                    handler_opts         = {
                        border = "none",
                    },
                }
                -- config = function() require("user.configs.signature") end,
            },
            {
                "folke/trouble.nvim", -- List of diagnostics
                -- opts = {
                --     position = "bottom", -- position of the list can be: bottom, top, left, right
                --     height = 10, -- height of the trouble list when position is top or bottom
                --     width = 50, -- width of the list when position is left or right
                --     icons = true, -- use devicons for filenames
                --     mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                --     fold_open = " ", -- icon used for open folds
                --     fold_closed = "", -- icon used for closed folds
                --     group = true, -- group results by file
                --     padding = true, -- add an extra new line on top of the list
                --     action_keys = { -- key mappings for actions in the trouble list
                --         -- map to {} to remove a mapping, for example:
                --         -- close = {},
                --         close = "q",                   -- close the list
                --         cancel = "<esc>",              -- cancel the preview and get back to your last window / buffer / cursor
                --         refresh = "r",                 -- manually refresh
                --         jump = { "<cr>", "<tab>" },    -- jump to the diagnostic or open / close folds
                --         open_split = { "<Leader>s" },  -- open buffer in new split
                --         open_vsplit = { "<Leader>v" }, -- open buffer in new vsplit
                --         open_tab = { "<Leader>t" },    -- open buffer in new tab
                --         jump_close = { "o" },          -- jump to the diagnostic and close the list
                --         toggle_mode = "m",             -- toggle between "workspace" and "document" diagnostics mode
                --         toggle_preview = "P",          -- toggle auto_preview
                --         hover = "K",                   -- opens a small popup with the full multiline message
                --         preview = "p",                 -- preview the diagnostic location
                --         close_folds = { "zM", "zm" },  -- close all folds
                --         open_folds = { "zR", "zr" },   -- open all folds
                --         toggle_fold = { "zA", "za" },  -- toggle fold of current file
                --         previous = "k",                -- previous item
                --         next = "j"                     -- next item
                --     },
                --     indent_lines = true,               -- add an indent guide below the fold icons
                --     auto_open = false,                 -- automatically open the list when you have diagnostics
                --     auto_close = false,                -- automatically close the list when you have no diagnostics
                --     auto_preview = false,              -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                --     auto_fold = false,                 -- automatically fold a file trouble list at creation
                --     auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
                --     signs = {
                --         -- icons / text used for a diagnostic
                --         error = " ",
                --         warning = " ",
                --         hint = " ",
                --         information = " ",
                --         other = "﫠"
                --     },
                --     use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
                -- },
                dependencies = { "kyazdani42/nvim-web-devicons" },
                -- config = function() require("user.configs.trouble") end,
            },

            "b0o/schemastore.nvim", -- JSON schemas downloader for JSON and YAML LSPs
            "hrsh7th/cmp-nvim-lsp", -- Completion integration with LSP
        }
    }
}