if not Langs.jinja.enabled then return {} end

local utils = require("core.utils")

Mason:update("jinja-lsp")
After:add(function()
    require("lspconfig").jinja_lsp.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)


return {}
