vim.lsp.enable("jsonls")
require("lint").linters_by_ft.json = { "jsonlint" }
