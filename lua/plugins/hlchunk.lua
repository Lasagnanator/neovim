---@type LazySpec
return {
	"shellRaining/hlchunk.nvim",
	branch = "main",
	config = function()
		local function get_color(hl)
			local hl_link = vim.api.nvim_get_hl(0, { name = hl }).link
			if hl_link ~= nil then
				return get_color(hl_link)
			end
			local color = vim.api.nvim_get_hl(0, { name = hl }).fg or vim.api.nvim_get_hl(0, { name = hl }).ctermfg
			return color
		end
		local colors = {
			chunk = string.format("#%x", get_color("CursorLineNr")),
			error = string.format("#%x", get_color("ErrorMsg")),
			indent = string.format("#%x", get_color("LineNr")), -- NOTE: consider hlgroup Whitespace
		}
		-- Configuration
		require("hlchunk").setup({
			chunk = {
				enable = true,
				delay = 0,
				style = {
					{ fg = colors.chunk },
					{ fg = colors.error },
				},
			},
			indent = {
				enable = true,
				style = colors.indent,
				exclude_filetypes = {
					undotree = true,
				},
			},
		})
	end,
	event = { "BufReadPre", "BufNewFile" },
}
