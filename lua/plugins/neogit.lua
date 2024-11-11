---@type LazyPluginSpec
return {
    "NeogitOrg/neogit",
    opts = {
        disable_hint = true,
        graph_style = "unicode",
        console_timeout = 100,
        auto_close_console = false,
        commit_editor = {
            spell_check = false,
        },
    },
    keys = require("keybinds.plugins.neogit"):to_lazy(),
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    }
}
