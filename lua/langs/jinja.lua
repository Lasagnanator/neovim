if not Langs.jinja then return {} end

local utils = require("core.utils")

Mason:update("jinja-lsp")

require("lspconfig").jinja_lsp.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})


return {}
