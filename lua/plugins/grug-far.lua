---@type LazyPluginSpec
return {
    "MagicDuck/grug-far.nvim",
    opts = {
        engines = {
            astgrep  = {
                path = "ast-grep"
            },
        },
        engine = (function ()
            if vim.fn.executable("ast-grep") == 1 then
                return "astgrep"
            else
                return "ripgrep"
            end
        end)(),
        windowCreationCommand = "tab split",
        keymaps = require("keybinds.plugins.grug-far").keymaps
    },
    cmd = "GrugFar"
}
