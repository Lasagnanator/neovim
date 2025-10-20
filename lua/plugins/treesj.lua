---@type LazySpec
return {
	"Wansmer/treesj",
	branch = "main",
	opts = {
		use_default_keymaps = false,
		max_join_length = 200,
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = require("keybinds.plugins.treesj"):to_lazy(),
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
