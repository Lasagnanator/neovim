---@diagnostic disable: different-requires
return {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
        require("oil").setup({
            columns = {
                "icon",
                "permissions",
                "size"
            },
            constrain_cursor = "editable",
            view_options = {
                show_hidden = true
            },
            float = {
                padding = 4,
            },
            keymaps = require("keybinds.plugins.oil").navigation
        })
    end,
    keys = require("keybinds.plugins.oil").global:to_lazy(),
    dependencies = { "nvim-tree/nvim-web-devicons" }
}
