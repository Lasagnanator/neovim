---@type LazySpec
return {
	{
		"williamboman/mason.nvim",
        version = '*',
		opts = { registries = { "github:mason-org/mason-registry" } },
		lazy = false,
		keys = require("keybinds.plugins.mason"):to_lazy(),
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
        branch = "main",
		opts = { ensure_installed = Mason.tools },
		dependencies = { "williamboman/mason.nvim" },
	},
}
