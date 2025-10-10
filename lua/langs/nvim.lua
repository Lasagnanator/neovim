if not Langs.nvim then
	return {}
end

---@type LazySpec
return {
	"folke/lazydev.nvim",
	version = "*",
	opts = {
		library = {
			"lazy.nvim",
		},
	},
	ft = "lua",
}
