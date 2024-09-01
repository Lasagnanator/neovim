return {
    "Wansmer/treesj",
    config = true,
    lazy = false,
    keys = require("keybinds.plugins.treesj"):to_lazy(),
    dependencies = { "nvim-treesitter/nvim-treesitter" },
}
