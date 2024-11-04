---@type LazySpec
return {
    {
        "3rd/image.nvim",
        cond = Langs.jupyter,
        opts = {
           backend = "ueberzug"
        },
        dependencies = {
            "leafo/magick"
        }
    },
    {
        "lukas-reineke/headlines.nvim",
        enabled = Langs.orgmode,
        opts = {
            markdown = {
                headline_highlights = false,
                bullet_highlights = false,
                codeblock_highlight = false,
                dash_highlight = false,
                quote_highlight = false
            },
            norg = {
                bullets = vim.empty_dict(),
                fat_headlines = true,
                fat_headline_upper_string = "▄",
                fat_headline_lower_string = "▀"
            },

            org = {
                fat_headlines = true,
                fat_headline_upper_string = "▄",
                fat_headline_lower_string = "▀"
            }
        },
        ft = { "norg", "org" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        "dhruvasagar/vim-table-mode",
        enabled = Langs.org or Langs.markdown,
        keys = require("keybinds.plugins.tablemode"):to_lazy({ "markdown", "norg", "org" })
    }
}
