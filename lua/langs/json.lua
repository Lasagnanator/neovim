if not Langs.json then return {} end

Mason:update("json-lsp")

require("lspconfig").jsonls.setup({
    on_attach = Utils.on_attach,
    capabilities = Utils.set_capabilities(),
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

return {}
