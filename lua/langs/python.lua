Treesitter:update("python")
Mason:update({ "debugpy", "basedpyright", "black" })
vim.lsp.enable("basedpyright")
require("conform").formatters_by_ft.python = { "black" }
