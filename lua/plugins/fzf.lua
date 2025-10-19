---@type LazySpec
return {
	"ibhagwan/fzf-lua",
    branch = "main",
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
	init = function()
		require("fzf-lua").register_ui_select()
	end,
	keys = require("keybinds.plugins.fzf"):to_lazy(),
	dependencies = { "nvim-mini/mini.icons" },
}
