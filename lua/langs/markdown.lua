if not Langs.markdown then return {} end

local utils = require("core.utils")

Treesitter:update({ "markdown", "markdown_inline" })
Mason:update({ "marksman", "vale" })

require("lspconfig").marksman.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

local lint = require("lint")
lint.linters_by_ft.markdown = { "vale" }
local vale_opts = lint.linters.vale.args
table.insert(vale_opts, "--config=" .. vim.fn.stdpath('config') .. "/files/vale.ini")
lint.linters.vale.args = vale_opts

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
    }
}
