return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup({
            plugins = {
                marks = true,
                registers = false,
                spelling = {
                    enabled = false
                },
                presets = {
                    enabled = false
                }
            },
        })
        wk.register(require("keybinds.whichkey"))
    end
}
