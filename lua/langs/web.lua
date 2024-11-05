if not Langs.web.enabled then return {} end

local utils = require("core.utils")

Treesitter:update({ "html", "css", "javascript", "typescript" })
Mason:update({ "css-lsp", "html-lsp", "typescript-language-server", "eslint-lsp", "prettierd" })
After:add(function()
    require("lspconfig").cssls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })

    require("lspconfig").html.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })

    require("lspconfig").ts_ls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })

    require("lspconfig").eslint.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })

    require("conform").formatters_by_ft.javascript = { "prettierd" }
    require("conform").formatters_by_ft.typescript = { "prettierd" }
end)

return {
    {
        "alvan/vim-closetag", -- Manipulate html tags
        ft = { "html", "xhtml", "phtml", "markdown", "php" },
        init = function()
            -- vim.cmd [[let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.md"]]
            -- vim.cmd [[let g:closetag_filetypes = "html,xhtml,phtml,markdown"]]
            vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.md"
            vim.g.closetag_filetypes = "html,xhtml,phtml,markdown"
        end
    },
}
