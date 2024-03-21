if not Langs.typescript then return {} end

local utils = require("core.utils")

Treesitter:update({ "typescript", "javascript" })
Mason:update("typescript-language-server")

require("lspconfig").tsserver.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {}
