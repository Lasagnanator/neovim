if not Langs.yaml then return {} end

Mason:update("yaml-language-server")

require("lspconfig").yamlls.setup({
    on_attach = Utils.on_attach,
    capabilities = Utils.set_capabilities(),
    settings = {
        yaml = {
            schemaStore = { enable = false },
            schemas = require('schemastore').yaml.schemas(),
        },
    },
})

return {}
