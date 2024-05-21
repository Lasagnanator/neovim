return {
    "Shatur/neovim-session-manager",                                                                     -- Automatic session manager
    opts = {
        sessions_dir              = require("plenary.path"):new(vim.fn.stdpath('data'), 'sessions'),     -- NOTE: not sure if useful
        autoload_mode             = "Disabled",
        autosave_ignore_dirs      = {},
        autosave_ignore_filetypes = {
            "gitcommit",
            "gitrebase",
        },
        autosave_ignore_buftypes  = {},
        autosave_only_in_session  = true,
    },
    init = function() require("keybinds.plugins.session"):set() end,
    dependencies = { "nvim-lua/plenary.nvim" },
}
