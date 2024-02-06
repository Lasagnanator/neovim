if not Langs.python then return {} end

local utils = require("core.utils")

Mason:update({ "autopep8", "debugpy", "mypy", "pydocstyle", "pylint", "pyright" })

require("lspconfig").pyright.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off", -- Options: off, basic, strict
            },
        },
    },
})

require("lspconfig").pylsp.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "E501" }
                },
            },
        }
    }
})

return {}
