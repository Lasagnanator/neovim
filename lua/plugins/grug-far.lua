---@type LazyPluginSpec
return {
    "MagicDuck/grug-far.nvim",
    opts = {
        engines = {
            astgrep  = {
                path = "ast-grep"
            },
        },
        engine = "ripgrep",
        windowCreationCommand = "tab split",
        keymaps = require("keybinds.plugins.grug-far").keymaps
    },
    cmd = "GrugFar",
    keys = require("keybinds.plugins.grug-far").global:to_lazy()
}
