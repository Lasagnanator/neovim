if Langs.python then
    vim.lsp.enable("ty")
    require("conform").formatters_by_ft.python = { "ruff" }
    require("lint").linters_by_ft.python = { "ruff" }
end
