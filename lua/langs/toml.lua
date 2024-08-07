if not Langs.toml then return {} end

local utils = require("core.utils")

Treesitter:update("toml")
Mason:update("taplo")

require("lspconfig").taplo.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {}
