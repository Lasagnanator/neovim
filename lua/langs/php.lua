if not Langs.php.enabled then return {} end

local utils = require("core.utils")

Treesitter:update({ "php", "phpdoc" })
Mason:update("phpactor")
After:add(function()
    require("lspconfig").phpactor.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)

return {}
