if Langs.nix then
    vim.lsp.enable("nixd")
    require("conform").formatters_by_ft.nix = { "alejandra" }
end
