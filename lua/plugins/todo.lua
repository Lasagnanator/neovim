---@type LazySpec
return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			keyword = "bg",
			pattern = [[.*<(KEYWORDS)]],
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = require("keybinds.plugins.todo"):to_lazy(),
}
