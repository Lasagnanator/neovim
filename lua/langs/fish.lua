if not Langs.fish then return {} end

local utils = require("core.utils")

Treesitter:update("fish")
-- TODO: add Mason install when they add the LSP to the registry
After:add(function()
    require("lspconfig").fish_lsp.setup({
        on_attach = utils.on_attach,
        set_capabilities = utils.set_capabilities()
    })
end)

return {}
