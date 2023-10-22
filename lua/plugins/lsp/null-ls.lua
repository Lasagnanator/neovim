local M = {}


M.set_handlers = function()
    local null_ls = require("null-ls")
    local handlers = {
        mypy = function()
            null_ls.register(null_ls.builtins.diagnostics.mypy.with({
                extra_args = { "--ignore-missing-imports", "--check-untyped-defs" }
            }))
        end,
        pylint = function()
            null_ls.register(null_ls.builtins.diagnostics.pylint.with({
                extra_args = {
                    "--disable=import-error,too-few-public-methods,unused-import,unused-argument" }
            }))
        end,
        pydocstyle = function()
            null_ls.register(null_ls.builtins.diagnostics.pydocstyle.with({
                extra_args = { "--ignore=D10,D203" }
            }))
        end,
        cpplint = function()
            null_ls.register(null_ls.builtins.diagnostics.cpplint.with({
                args = { "--filter=-legal/copyright", "$FILENAME" }
            }))
        end,
        clang_format = function()
            null_ls.register(null_ls.builtins.formatting.clang_format.with({
                extra_args = { "--style",
                    "file:" .. os.getenv("HOME") .. "/.config/nvim/files/clang-format" }
            }))
        end,
        sql_formatter = function()
            null_ls.register(null_ls.builtins.formatting.sql_formatter.with({
                extra_args = { "-c", os.getenv("HOME") .. "/.config/nvim/files/sql-formatter.json" }
            }))
        end,
    }
    return handlers
end


return M
