Treesitter:update({ "json", "jsonc" })
Mason:update({ "json-lsp", "jsonlint" })
vim.lsp.enable("jsonls")
require("lint").linters_by_ft.json = { "jsonlint" }

