return {
    "Wansmer/treesj",
    opts = {
        use_default_keymaps = false,
    },
    lazy = false,
    keys = require("keybinds.plugins.treesj"):to_lazy(),
    dependencies = { "nvim-treesitter/nvim-treesitter" },
}
