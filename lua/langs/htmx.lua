if not Langs.htmx.enabled then return {} end

local utils = require("core.utils")

Mason:update("htmx-lsp")
After:add(function()
    require("lspconfig").htmx.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)

return {}
