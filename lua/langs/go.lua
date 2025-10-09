Treesitter:update({ "go", "gomod", "gosum", "gotmpl", "gowork" })
Mason:update({ "gopls", "delve", "gofumpt", "gomodifytags", "goimports", "impl" })
vim.lsp.enable("gopls")
-- XXX: experimental, to be tested
require("conform").formatters_by_ft.go = { "gofumpt", "gomodifytags", "goimports" }
