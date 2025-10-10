if not Langs.xml then
    return {}
end

Treesitter:update({ "xml" })
Mason:update({ "lemminx", "xmlformatter" })
vim.lsp.enable("lemminx")
require("conform").formatters_by_ft.xml = { "xmlformatter" }

return {}
