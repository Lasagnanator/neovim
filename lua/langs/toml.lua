if not Langs.toml.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("toml")
Mason:update("taplo")
After:add(function()
    require("lspconfig").taplo.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)

return {}
