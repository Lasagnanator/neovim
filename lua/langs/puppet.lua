if not Langs.puppet then return {} end

local utils = require("core.utils")

Treesitter:update("puppet")
Mason:update("puppet-editor-services")

require("lspconfig").puppet.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {}
