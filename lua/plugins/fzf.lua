---@type LazySpec
return {
	"ibhagwan/fzf-lua",
	opts = {
		files = {
			cwd_prompt = false,
		},
		grep = {
			prompt = "Rg? ",
			no_header = true,
			no_header_i = true,
		},
	},
	keys = require("keybinds.plugins.fzf"):to_lazy(),
	init = function()
		require("fzf-lua").register_ui_select()
	end,
	dependencies = { "nvim-mini/mini.icons" },
}
