return {
    "SmiteshP/nvim-navbuddy",
    opts= {
        lsp = {
            auto_attach = true
        }
    },
    event = { "BufReadPre", "BufNewFile" },
    keys = require("keybinds.plugins.navbuddy"):to_lazy(),
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
    },
}
