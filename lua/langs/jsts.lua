if not Langs.jsts then return {} end

local utils = require("core.utils")

Treesitter:update({ "typescript", "javascript" })
Mason:update({ "typescript-language-server", "eslint-lsp", "prettierd" })

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
