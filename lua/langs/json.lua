if not Langs.json.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("json")
Mason:update({ "json-lsp", "jsonlint" })
After:add(function()
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
end)

require("lint").linters_by_ft.json = { "jsonlint" }

return {}
