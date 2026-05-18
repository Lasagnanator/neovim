if Langs.puppet then
    vim.lsp.enable("puppet")
    require("lint").linters_by_ft.puppet = { "puppet-lint" }
    require("conform").formatters_by_ft.puppet = { "puppet-lint" }
end
