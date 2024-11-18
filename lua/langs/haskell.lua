if not Langs.haskell.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("haskell")
Mason:update({ "haskell-language-server", "haskell-debug-adapter", "hlint", "fourmolu" })
After:add(function()
    require("lspconfig").hls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities()
    })

    require("conform").formatters_by_ft.haskell = { "fourmolu" }
    require("lint").linters_by_ft.haskell = { "hlint" }
end)

return {}
