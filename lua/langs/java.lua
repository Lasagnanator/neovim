if not Langs.java then return {} end

local utils = require("core.utils")



-- require("lspconfig").pyright.setup({
--     on_attach = utils.on_attach,
--     capabilities = utils.set_capabilities(),
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "workspace",
--                 useLibraryCodeForTypes = true,
--                 typeCheckingMode = "basic", -- Options: off, basic, strict
--             },
--         },
--     },
-- })
--
-- require('lint').linters_by_ft.python = { "pylint" }
--
-- require("conform").formatters_by_ft.python = { "pyink" }

-- TODO: try the plugin "nvim-java/nvim-java"
return {
    {
        "mfussenegger/nvim-jdtls"
    },
    {
        "simaxme/java.nvim"
    }
}
