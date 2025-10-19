---@type LazySpec
return {
	"folke/todo-comments.nvim",
    branch = "main",
	opts = {
		highlight = {
			keyword = "bg",
			pattern = [[.*<(KEYWORDS)]],
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = require("keybinds.plugins.todo"):to_lazy(),
	dependencies = { "nvim-lua/plenary.nvim" },
}
