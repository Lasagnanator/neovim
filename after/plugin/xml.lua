if Langs.xml then
    vim.lsp.enable("lemminx")
    require("conform").formatters_by_ft.xml = { "xmlformatter" }
end
