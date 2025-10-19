---@type LazySpec
return {
	"ibhagwan/fzf-lua",
	branch = "main",
	config = function()
		local fzf = require("fzf-lua")
		local actions = require("fzf-lua.actions")
		fzf.setup({
			files = {
				cwd_prompt = false,
				actions = {
					["default"] = actions.file_edit,
					["ctrl-s"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
					["ctrl-t"] = actions.file_tabedit,
					["ctrl-q"] = actions.file_sel_to_qf,
					["alt-q"] = { fn = actions.file_sel_to_qf, prefix = "select-all" },
				},
			},
			grep = {
				prompt = "> ",
				no_header = true,
				no_header_i = true,
			},
		})
		require("fzf-lua").register_ui_select()
	end,
	keys = require("keybinds.plugins.fzf"):to_lazy(),
    cmd = "FzfLua",
	dependencies = { "nvim-mini/mini.icons" },
}
