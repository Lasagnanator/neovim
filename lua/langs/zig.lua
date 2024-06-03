if not Langs.zig then return {} end

local utils = require("core.utils")

Treesitter:update("zig")
Mason:update({ "zls", "codelldb" })

require("lspconfig").zls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {}
