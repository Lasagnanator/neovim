return {
    {
        "Bekaboo/dropbar.nvim",
        -- TODO: remove when https://github.com/Bekaboo/dropbar.nvim/issues/177 is fixed
        commit = "d26bf92",
        lazy = false,
        keys = require("keybinds.plugins.dropbar"):to_lazy(),
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-fzf-native.nvim", -- optional, but required for fuzzy finder support
        }
    }
}
