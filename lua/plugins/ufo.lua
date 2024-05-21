return {
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
}
