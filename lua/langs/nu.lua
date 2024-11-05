if not Langs.nu.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("nu")
After:add(function()
    require("lspconfig").nushell.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities()
    })
end)

return {}
