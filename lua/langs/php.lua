if not Langs.php then return {} end

local utils = require("core.utils")

Treesitter:update({ "php", "phpdoc" })
Mason:update("phpactor")

require("lspconfig").phpactor.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {}
