---@diagnostic disable: different-requires
return {
    "sindrets/diffview.nvim",     -- Viewer for diffs and merge resolution
    config = function()
        local diffview = require("diffview")
        diffview.setup({
            enhanced_diff_hl = true,
            view = {
                default = { layout = 'diff2_horizontal' },
                merge_tool = {
                    layout = 'diff3_mixed',
                    disable_diagnostics = true,
                },
            },
            keymaps = {
                disable_defaults = false,
                view = require("keybinds.plugins.diffview").view:to_list()
            },
        })
        require("keybinds.plugins.diffview").global:set()
        -- TODO: check if it works at least on Linux
        vim.opt.fillchars:append({ diff = "╱" })
    end,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
}
