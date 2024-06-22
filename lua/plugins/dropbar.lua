return {
    {
        "Bekaboo/dropbar.nvim",
        lazy = false,
        keys = require("keybinds.plugins.dropbar"):to_lazy(),
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-fzf-native.nvim", -- optional, but required for fuzzy finder support
        }
    }
}
