if Langs.go then
    vim.lsp.enable("gopls")
    -- XXX: experimental, to be tested
    require("conform").formatters_by_ft.go = { "gofumpt", "gomodifytags", "goimports" }
end
