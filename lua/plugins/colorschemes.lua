local function isNeovide()
	return not vim.g.neovide == true -- Negation should handle undefined case better
end

---@type LazySpec
return {
	{
		"folke/tokyonight.nvim",
		release = "*",
		opts = {
			style = "night", -- night, storm, day, moon
			styles = {
				sidebars = "normal",
				floats = "normal",
			},
			sidebars = { "qf", "help" },
			transparent = isNeovide(),
		},
		priority = Priority.colorscheme,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		release = "*",
		opts = {
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			transparent_background = isNeovide(),
		},
		priority = Priority.colorscheme,
	},
	{
		"ellisonleao/gruvbox.nvim",
		branch = "main",
		priority = Priority.colorscheme,
	},
	{
		"maxmx03/fluoromachine.nvim",
		enabled = false,
		branch = "main",
		opts = {
			theme = "fluoromachine", -- fluoromachine, retrowave, delta
			glow = false,
			transparent = isNeovide(),
		},
		priority = Priority.colorscheme,
	},
	{
		"navarasu/onedark.nvim",
		branch = "master",
		opts = {
			style = "darker", -- dark, darker, cool, deep, warm, warmer, light
			term_colors = true,
			transparent = false,
		},
        init = function ()
			-- TODO: check if still needed or if it can be integrated within plugin configuration
			if Colorscheme == "onedark" then
				vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier", { link = "Operator" })
				vim.api.nvim_set_hl(0, "@lsp.type.operator", { link = "Operator" })
				vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Function" })
			end
        end,
		priority = Priority.colorscheme,
	},
	{
		"rebelot/kanagawa.nvim",
		branch = "master",
		opts = {
			theme = "wave", -- wave, dragon, lotus
			transparent = isNeovide(),
		},
		priority = Priority.colorscheme,
	},
	{
		"shaunsingh/moonlight.nvim",
		enabled = false,
        branch = "pure-lua",
		init = function()
			if Colorscheme == "moonlight" then
                vim.g.moonlight_italic_comments = true
                vim.g.moonlight_borders = true
                vim.g.moonlight_italic_functions = true

                -- TODO: check if still needed
				vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier", { link = "Operator" })
				vim.api.nvim_set_hl(0, "WinBar", { bold = true })
				vim.api.nvim_set_hl(0, "WinBarNC", { bold = true, fg = "NvimLightGrey4" })
			end
		end,
		priority = Priority.colorscheme,
	},
	{
		"wilmanbarrios/palenight.nvim",
		enabled = false,
        branch = "main",
		priority = Priority.colorscheme,
	},
	{
		"loctvl842/monokai-pro.nvim",
		enabled = false,
        version = "*",
		opts = {
			filter = "pro", -- classic, octagon, pro, machine, ristretto, spectrum
            styles = {
                comment = { italic = true },
            },
            transparent_background = isNeovide(),
		},
		priority = Priority.colorscheme,
	},
	{
		"Mofiqul/dracula.nvim",
		enabled = false,
        branch = "main",
		opts = {
			show_end_of_buffer = true,
			italic_comment = true,
			transparent_bg = isNeovide(),
		},
		priority = Priority.colorscheme,
	},
}
