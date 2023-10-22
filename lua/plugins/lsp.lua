return {
    {
        "neovim/nvim-lspconfig", -- Defaults for LSP
    },
    {
        "williamboman/mason-lspconfig.nvim", -- Bridges the two plugins
        config = function()
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({
                ensure_installed = { "bashls", "lua_ls" }, -- If not found, download and install declared LSPs; Python uses "pylsp" "pyright"
            })
            mason_lsp.setup_handlers(require("plugins.lsp.mason").set_handlers())
            -- mason_lsp.setup_handlers(require("plugins.lsp.mason")())
        end,
        dependencies = {
            {
                "williamboman/mason.nvim", -- Automate installation of LSP servers
                opts = {
                    ui = {
                        -- border = "single",
                        icons = {
                            package_installed = "",
                            package_pending = "➜",
                            package_uninstalled = ""
                        }
                    }
                },
                init = function() Utils.set_keybinds(Keybinds.lsp().mason) end
            }
        }
    },
    {
        "jose-elias-alvarez/null-ls.nvim", -- Enable linters and formatters to use the LSP client
        config = true,
        dependencies = {
            {
                "jay-babu/mason-null-ls.nvim", -- Bridge the gap between Mason and null-ls
                config = function()
                    require("mason-null-ls").setup({
                        ensure_installed = {},
                        automatic_installation = false,
                        automatic_setup = true,
                        handlers = require("plugins.lsp.null-ls").set_handlers()
                    })
                end,
            },
            { "nvim-lua/plenary.nvim" },
        },
    },
    {
        "ray-x/lsp_signature.nvim", -- Shows signature of function while typing
        opts = {
            doc_lines            = 0,
            toggle_key           = "<C-0>",
            select_signature_key = "<A-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
            move_cursor_key      = "<A-m>", -- imap, use nvim_set_current_win to move cursor between current win and floating
            max_height           = 5,       -- max height of signature floating_window
            max_width            = 80,      -- max_width of signature floating_window
            hint_enable          = false,
            bind                 = true,    -- Mandatory for window borders
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
            use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
        },
        keys = Utils.lazy_keybinds(Keybinds.trouble()),
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
        keys = Utils.lazy_keybinds(Keybinds.todo()),
    },
    "b0o/schemastore.nvim", -- JSON schemas downloader for JSON and YAML LSPs
    "hrsh7th/cmp-nvim-lsp", -- Completion integration with LSP
}
