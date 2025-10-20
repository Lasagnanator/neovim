---@type LazySpec
return {
	"nvim-mini/mini.ai",
	version = "*",
	config = true,
    event = { "BufReadPre", "BufNewFile" }
}
