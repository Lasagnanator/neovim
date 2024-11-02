return {
    {
        "mfussenegger/nvim-dap", -- Debug adapter
        event = { "LspAttach" },
        keys = require("keybinds.plugins.dap").debug:to_lazy()
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
        "theHamsta/nvim-dap-virtual-text",
        config = true,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        }
    },
    -- TODO: eval
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
}
