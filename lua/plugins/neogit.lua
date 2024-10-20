return {
    "NeogitOrg/neogit",
    lazy = false,
    opts = {
        disable_hint = true,
        graph_style = "unicode",
        console_timeout = 0,
        commit_editor = {
            spell_check = false,
        },
    },
    keys = require("keybinds.plugins.neogit"):to_lazy(),
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
    }
}
