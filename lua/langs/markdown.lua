if not Langs.markdown then return {} end

local utils = require("core.utils")

Treesitter:update({ "markdown", "markdown_inline" })
Mason:update("marksman")

require("lspconfig").marksman.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("lint").linters_by_ft.markdown = vim.empty_dict()

return {
    {
        "iamcco/markdown-preview.nvim", -- Preview markdown files in browser
        build = "app/install.sh",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    },
    {
        "richardbizik/nvim-toc",
        opts = {
            toc_header = "Table of Contents"
        },
        ft = { "markdown" }
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        main = "render-markdown",
        opts = {},
        ft = { "markdown" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    }
}
