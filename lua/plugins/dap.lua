---@type LazySpec
return {
    -- TODO: configure
	{
		"mfussenegger/nvim-dap",
        branch = "master",
		event = { "LspAttach" },
		keys = require("keybinds.plugins.dap").debug:to_lazy(),
	},
    -- TODO: configure
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
    -- TODO: configure and evaluate usefulness
    {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        }
    },
}
