if not Langs.python then return {} end

local utils = require("core.utils")

-- List from personal laptop
-- Mason:update({ "autopep8", "debugpy", "mypy", "pydocstyle", "pylint", "pyright" })
Treesitter:update("python")
Mason:update({ "debugpy", "pyink", "pylint", "pyright" })

require("lspconfig").pyright.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic", -- Options: off, basic, strict
            },
        },
    },
})

require('lint').linters_by_ft.python = { "pylint" }

require("conform").formatters_by_ft.python = { "pyink" }

return {}
