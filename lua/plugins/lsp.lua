return {
    {
        "folke/neoconf.nvim",
    },
    {
        "folke/neodev.nvim",
        enable = Langs.nvim,
        opts = {}
    },
    {
        "neovim/nvim-lspconfig", -- Defaults for LSP
    },
    -- NOTE: remove with update to 0.10
    {
        "lvimuser/lsp-inlayhints.nvim",
        config = true
    },
    {
        "mfussenegger/nvim-dap", -- Debug adapter
        event = { "LspAttach" },
        keys = require("keybinds.plugins.dap").debug:to_lazy()
    },
    {
        "williamboman/mason.nvim", -- Frontend for tools like LSPs, debuggers, linters and formatters
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
        init = function() require("keybinds.plugins.mason"):set() end
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- Automate the installation of language tools from Mason
        opts = {
            ensure_installed = Mason.tools
        },
        dependencies = { "williamboman/mason.nvim" }
    },
    {
        "rcarriga/nvim-dap-ui",
        opts = {
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = ""
            },
        },
        event = { "LspAttach" },
        keys = require("keybinds.plugins.dap").ui:to_lazy(),
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            handlers = {
                function(config) -- catch all
                    require('mason-nvim-dap').default_setup(config)
                end,
            },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        }
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
        event = { "BufReadPre", "BufNewFile" },
        keys = require("keybinds.plugins.trouble"):to_lazy(),
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
        event = { "BufReadPre", "BufNewFile" },
        keys = require("keybinds.plugins.todo"):to_lazy()
    },
    "b0o/schemastore.nvim", -- JSON schemas downloader for JSON and YAML LSPs
    "hrsh7th/cmp-nvim-lsp", -- Completion integration with LSP
}
