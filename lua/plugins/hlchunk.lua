return {
    "shellRaining/hlchunk.nvim",
    config = function()
        local colors = {
            chunk = string.format("#%x", vim.api.nvim_get_hl(0, { name = "CursorLineNr" }).fg),
            error = string.format("#%x", vim.api.nvim_get_hl(0, { name = "ErrorMsg" }).fg),
            indent = string.format("#%x", vim.api.nvim_get_hl(0, { name = "LineNr" }).fg) -- NOTE: consider hlgroup Whitespace
        }
        require("hlchunk").setup({
            chunk = {
                enable = true,
                delay = 0,
                style = {
                    { fg = colors.chunk },
                    { fg = colors.error }
                }
            },
            indent = {
                enable = true,
                style = colors.indent
            }
        })
    end,
    event = { "BufReadPre", "BufNewFile" },
}
