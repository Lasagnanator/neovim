local spectre_keys = require("keybinds.plugins.spectre")

-- TODO: Check grug-far as an alternative
return {
    "nvim-pack/nvim-spectre",
    opts = {
        open_cmd = "tabnew",
        -- TODO: Add keybinds under Leader-m
        mapping = spectre_keys.buffer,
    },
    keys = spectre_keys.global:to_lazy(),
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    }
}
