return {
    "joshuadanpeterson/typewriter.nvim",
    opts = {
        enable_horizontal_scroll = false,
    },
    keys = require("keybinds.plugins.typewriter"):to_lazy(),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}
