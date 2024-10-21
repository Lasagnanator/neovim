if not Langs.json then return {} end

local utils = require("core.utils")

Treesitter:update("json")
Mason:update({ "json-lsp", "jsonlint" })

require("lspconfig").jsonls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

require("lint").linters_by_ft.json = { "jsonlint" }

return {}
