---@type LazySpec
return {
    "MagicDuck/grug-far.nvim",
    opts = {
        windowCreationCommand = "tab split",
        keymaps = require("keybinds.plugins.grug-far").keymaps,
    },
    lazy = false,
    keys = require("keybinds.plugins.grug-far").global:to_lazy()
}
