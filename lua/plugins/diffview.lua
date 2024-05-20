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
                disable_defaults = false,     -- Disable the default keymaps
                view = require("keybinds.plugins.diffview").view:to_list()
            },
        })
        require("keybinds.plugins.diffview").global:set()
    end,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
}
