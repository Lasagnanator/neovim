if not Langs.lua then return {} end

local utils = require("core.utils")

Treesitter:update("lua")
Mason:update("lua-language-server")
After:add(function()
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
end)

---@type LazySpec
return {
    "folke/lazydev.nvim",
    cond = Langs.nvim,
    opts = {
        library = {
            "lazy.nvim"
        }
    },
    ft = "lua",
}
