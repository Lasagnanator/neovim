if Langs.nix then
    vim.lsp.enable("nil_ls")
    require("conform").formatters_by_ft.nix = { "nixfmt" }
end
