return {
    {
        "neovim/nvim-lspconfig", -- Defaults for LSP
        priority = Priority.lsp,
        dependencies = {
            { import = "user.plugins.lsp.mason"},
            { import = "user.plugins.lsp.null-ls" },
            {
                "ray-x/lsp_signature.nvim", -- Shows signature of function while typing
                opts = {
                    doc_lines            = 0,
                    toggle_key           = "<C-0>",
                    select_signature_key = "<A-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
                    move_cursor_key      = "<A-m>", -- imap, use nvim_set_current_win to move cursor between current win and floating
                    max_height           = 5,       -- max height of signature floating_window
                    max_width            = 80,      -- max_width of signature floating_window
                    -- hint_enable          = true,
                    -- hint_prefix          = "Hint: ",
                    bind                 = true, -- Mandatory for window borders
                    handler_opts         = {
                        border = "none",
                    },
                }
            },
            {
                "folke/trouble.nvim", -- List of diagnostics
                opts = {
                    action_keys = {
                        jump = { "<cr>", "<tab>" },
                    },
                    -- auto_preview = false,
                    -- signs = {
                    --     error = " ",
                    --     warning = " ",
                    --     hint = " ",
                    --     information = " ",
                    --     other = "﫠"
                    -- },
                    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
                },
                dependencies = { "kyazdani42/nvim-web-devicons" },
            },
            "b0o/schemastore.nvim", -- JSON schemas downloader for JSON and YAML LSPs
            "hrsh7th/cmp-nvim-lsp", -- Completion integration with LSP
        }
    }
}
