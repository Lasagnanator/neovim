---@type LazySpec
return {
	"cenk1cenk2/schema-companion.nvim",
	cond = Langs.yaml or Langs.json or Langs.toml,
	lazy = false,
	config = function()
		require("schema-companion").setup({})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
