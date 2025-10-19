---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()
		ts.install(Treesitter.parsers)
	end,
	build = ":TSUpdate",
	lazy = false,
	priority = Priority.treesitter,
}
