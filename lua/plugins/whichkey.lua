return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup({
            modes = {
                n = true, -- Normal mode
                i = false, -- Insert mode
                x = false, -- Visual mode
                s = false, -- Select mode
                o = false, -- Operator pending mode
                t = false, -- Terminal mode
                c = false, -- Command mode
            },
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
        wk.add(require("keybinds.whichkey"))
    end
}
