---@type LazySpec
return {
	"ibhagwan/fzf-lua",
	opts = {},
	keys = require("keybinds.plugins.fzf"):to_lazy(),
	init = function()
		require("fzf-lua").register_ui_select()
	end,
	dependencies = { "nvim-mini/mini.icons" },
}
