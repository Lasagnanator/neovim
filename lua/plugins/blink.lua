---@type LazySpec
return {
	"saghen/blink.cmp",
	version = "*",
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "hide", "fallback" },
			["<Esc>"] = { "hide", "fallback" },
			["<C-e>"] = { "show_documentation", "hide_documentation", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			trigger = {
				show_in_snippet = true,
			},
			list = {
				selection = {
					preselect = false,
				},
			},
			documentation = {
				auto_show = false,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},
	opts_extend = { "sources.default" },
	dependencies = { "rafamadriz/friendly-snippets" },
}
