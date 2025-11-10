---@type LazySpec
return {
    "NeogitOrg/neogit",
    branch = "master",
    opts = {
        disable_hint = true,
        graph_style = "unicode",
        commit_editor = {
            spell_check = false,
        },
    },
    cmd = { "Neogit" },
    keys = require("keybinds.plugins.neogit"):to_lazy(),
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
