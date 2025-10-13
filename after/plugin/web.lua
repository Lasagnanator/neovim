vim.lsp.enable("cssls")
vim.lsp.enable("html")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
require("conform").formatters_by_ft.javascript = { "prettierd" }
require("conform").formatters_by_ft.typescript = { "prettierd" }
