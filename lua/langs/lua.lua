if not Langs.lua then return {} end

local utils = require("core.utils")

Treesitter:update("lua")
Mason:update("lua-language-server")

require("lspconfig").lua_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        Lua = {
            telemetry = {
                enable = false,
            },
            hint = {
                enable = false,
            }
        },
    },
})


return {
    "folke/lazydev.nvim",
    enabled = Langs.nvim,
    config = true,
    ft = "lua",
}
