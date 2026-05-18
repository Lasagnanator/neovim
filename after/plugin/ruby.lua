if Langs.ruby then
    vim.lsp.enable("ruby_lsp")
    require("lint").linters_by_ft.ruby = { "rubocop" }
end
