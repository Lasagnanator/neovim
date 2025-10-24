if Langs.python then
    vim.lsp.enable("basedpyright")
    require("conform").formatters_by_ft.python = { "black" }
end
