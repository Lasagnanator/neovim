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
            constrain_cursor = "name",
        })
    end,
    keys = require("keybinds.plugins.oil"):to_lazy(),
    dependencies = { "nvim-tree/nvim-web-devicons" }
}
