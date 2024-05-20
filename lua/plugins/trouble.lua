return {
    "folke/trouble.nvim",     -- List of diagnostics
    opts = {
        action_keys = {
            jump = { "<cr>", "<tab>" },
        },
        -- auto_preview = false,
        use_diagnostic_signs = true     -- enabling this will use the signs defined in your lsp client
    },
    event = { "BufReadPre", "BufNewFile" },
    keys = require("keybinds.plugins.trouble"):to_lazy(),
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
