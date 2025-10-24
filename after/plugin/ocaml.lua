if Langs.ocaml then
    vim.lsp.enable("ocamllsp")
    require("conform").formatters_by_ft.ocaml = { "ocamlformat" }
end
