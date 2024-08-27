if not Langs.json then return {} end

local utils = require("core.utils")

Treesitter:update("json")
Mason:update({ "json-lsp", "jsonlint" })

require("lspconfig").jsonls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        json = {
            schemas = require("schemastore").json.schemas({
                replace = {
                    ['devcontainer.json'] = {
                        description = "dev container configuration files",
                        fileMatch = { "devcontainer.json", ".devcontainer.json" },
                        name = "devcontainer.json",
                        -- url = "https://raw.githubusercontent.com/devcontainers/spec/main/schemas/devContainer.schema.json"
                        url = "file://" .. vim.fn.stdpath('config') .. '/files/devcontainer-override.json'
                    }
                }
            }),
            validate = { enable = true },
        },
    },
})

require("lint").linters_by_ft.json = { "jsonlint" }

return {}
