---@type LazySpec
return {
	"stevearc/oil.nvim",
	branch = "master",
	---@module "oil"
	---@type oil.SetupOpts
	opts = {
		preview_win = {
			disable_preview = function()
				return false
			end,
		},
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 5,
		},
		keymaps = require("keybinds.plugins.oil").navigation,
	},
	keys = require("keybinds.plugins.oil").global:to_lazy(),
	lazy = false,
	dependencies = { "nvim-mini/mini.icons" },
}
