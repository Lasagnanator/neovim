if not Langs.jinja then
    return {}
end

Mason:update("jinja-lsp")
vim.lsp.enable("jinja_lsp")

return {}
