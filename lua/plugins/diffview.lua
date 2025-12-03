---@diagnostic disable: different-requires
---@type LazySpec
return {
    "sindrets/diffview.nvim",
    branch = "main",
    config = function()
        local diffview = require("diffview")
        diffview.setup({
            enhanced_diff_hl = true,
            view = {
                default = { layout = "diff2_horizontal" },
                merge_tool = {
                    layout = "diff3_mixed",
                    disable_diagnostics = true,
                },
            },
        })
        require("keybinds.plugins.diffview").global:set()
        vim.opt.fillchars:append({ diff = "╱" })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-mini/mini.icons",
    },
}
