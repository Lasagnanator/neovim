---@type LazySpec
return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup({
            ---@param ctx { mode: string, operator: string }
            defer = function(ctx)
                return vim.list_contains({ "v", "V", "<C-V>" }, ctx.mode)
            end,
            triggers = {
                { "<auto>", mode = "nx" },
            },
            plugins = {
                marks = false,
                registers = false,
                spelling = {
                    enabled = false
                },
                presets = {
                    enabled = false
                }
            },
        })
        wk.add(require("keybinds.whichkey"))
    end

}
