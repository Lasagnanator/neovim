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
    },
    {
        "kevinhwang91/nvim-ufo",
        config = function()
            local filetypes = {
                norg             = { "treesitter", "indent" },
                sql              = { "treesitter", "indent" },
                mysql            = { "treesitter", "indent" },
                plsql            = { "treesitter", "indent" },
                ["yaml.ansible"] = "indent",
                yaml             = "indent",
                caddy            = "indent",
                kitty            = "indent",
                yuck             = "indent",
                hypr             = "indent",
                fish             = "indent",
                ps1              = "indent",
                harpoon          = "",
                oil              = "",
                tex              = "",
                dbui             = "",
                dbout            = "",
                [""]             = ""
            }
            require("keybinds.plugins.ufo"):set()
            require("ufo").setup({
                open_fold_hl_timeout = 150,
                provider_selector = function(bufnr, filetype, _)
                    if vim.bo[bufnr].bt == "nofile"
                    then
                        return ""
                    end
                    return filetypes[filetype] or { "lsp", "indent" }
                end
            })
        end,
        dependencies = { "kevinhwang91/promise-async" }
    },
    -- TODO: move the following plugins to appropriate language files
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
