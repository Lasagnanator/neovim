return {
    {
        "lukas-reineke/headlines.nvim",
        enabled = Langs.orgmode or Langs.neorg,
        opts = {
            markdown = {
                headline_highlights = false,
                bullet_highlights = false,
                codeblock_highlight = false,
                dash_highlight = false,
                quote_highlight = false
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
