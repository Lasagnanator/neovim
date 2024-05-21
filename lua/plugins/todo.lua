return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    event = { "BufReadPre", "BufNewFile" },
    keys = require("keybinds.plugins.todo"):to_lazy()
}
