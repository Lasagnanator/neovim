if not Langs.lua then return {} end

Treesitter:update("lua")
Mason:update({"lua-language-server", "stylua"})

vim.lsp.config("lua_ls", {
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

vim.lsp.enable("lua_ls")

require("conform").formatters_by_ft.lua = { "stylua" }

---@type LazySpec
return {
    "folke/lazydev.nvim",
    cond = Langs.nvim,
    version = "*",
    opts = {
        library = {
            "lazy.nvim"
        }
    },
    ft = "lua",
}
