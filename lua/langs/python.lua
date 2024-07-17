if not Langs.python then return {} end

local utils = require("core.utils")

Treesitter:update("python")
Mason:update({ "debugpy", "pyink", "pylint", "basedpyright" })

require("lspconfig").basedpyright.setup({
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

-- TODO: configure formatters and linters
-- mypy: extra_args = { "--ignore-missing-imports", "--check-untyped-defs" }
-- pylint: extra_args = { "--disable=import-error,too-few-public-methods,unused-import,unused-argument" } }
-- pydocstyle: extra_args = { "--ignore=D10,D203" }

return {}
