if not Langs.puppet.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("puppet")
Mason:update("puppet-editor-services")
After:add(function()
    require("lspconfig").puppet.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)

return {}
