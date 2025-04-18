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

return {}
