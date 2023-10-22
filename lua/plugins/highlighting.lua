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
    {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        priority = Priority.treesitter,
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "lua",
                "bash",
                "gitcommit",
                "gitignore",
                "gitattributes",
                "git_config",
                "git_rebase",
                "norg"
            },
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
                keymaps = Keybinds.treesitter().incremental_selection,
                disable = excluded_langs,
            },
        },
    },
    {
        "isobit/vim-caddyfile", -- Caddyfile syntax highlighting
        ft = { "caddy" },
    },
    {
        "fladson/vim-kitty", -- Kitty.conf file syntax highlighting
        ft = { "kitty" },
    },
    {
        "elkowar/yuck.vim", -- .yuck file syntax highlighting
        ft = { "yuck" },
    },
    {
        "theRealCarneiro/hyprland-vim-syntax", -- Hyprland configuration syntax highlighting
        ft = { "hypr" },
    },
    {
        "khaveesh/vim-fish-syntax", -- Fish LSP
        ft = { "fish" },
    },
    {
        "pprovost/vim-ps1",
        ft = { "ps1" },
    }
}
