if not Langs.lua then
    return {}
end

Treesitter:update("lua")
Mason:update({ "lua-language-server", "stylua" })

vim.lsp.enable("lua_ls")
require("conform").formatters_by_ft.lua = { "stylua" }

return {}
