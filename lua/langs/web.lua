if not Langs.web then return {} end

local utils = require("core.utils")

Treesitter:update({ "html", "css", "javascript", "typescript" })
Mason:update({ "css-lsp", "html-lsp", "typescript-language-server", "eslint-lsp", "prettierd" })

require("lspconfig").cssls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("lspconfig").html.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("lspconfig").tsserver.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("lspconfig").eslint.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("conform").formatters_by_ft.javascript = { "prettierd" }
require("conform").formatters_by_ft.typescript = { "prettierd" }

return {}
