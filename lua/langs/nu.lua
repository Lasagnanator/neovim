if not Langs.nu then return {} end

local utils = require("core.utils")

Treesitter:update("nu")

require("lspconfig").nushell.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities()
})

return {}
