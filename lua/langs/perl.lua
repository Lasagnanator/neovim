if not Langs.perl then return {} end

local utils = require("core.utils")

Treesitter:update("perl")
Mason:update("perl-debug-adapter")
After:add(function()
    require("lspconfig").perlpls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)

return {}
