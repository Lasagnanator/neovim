if not Langs.web then return {} end

local utils = require("core.utils")

Mason:update({ "css-lsp", "html-lsp" })

require("lspconfig").cssls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("lspconfig").html.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {}
