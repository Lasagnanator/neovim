local excluded_langs = {
    "yaml.ansible",
    "tex",
    "caddy",
    "kitty",
    "yuck",
    "hypr",
    "ps1"
}
return {
    "nvim-treesitter/nvim-treesitter",     -- Syntax highlighting
    priority = Priority.treesitter,
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = Treesitter.parsers,
        highlight = {
            enable = true,
            disable = excluded_langs,
        },
        indent = {
            enable = true,
            disable = excluded_langs,
        },
        incremental_selection = {
            enable = true,
            keymaps = require("keybinds.plugins.treesitter").incremental_selection,
            disable = excluded_langs,
        },
    },
}
