vim.lsp.enable("bash_ls")
vim.lsp.enable("awk_ls")
require("conform").formatters_by_ft.sh = { "shfmt" }
require("conform").formatters_by_ft.bash = { "shfmt" }
