--<< NULL-LS >>--

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
    return
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
    return
end

mason_null_ls.setup({
    ensure_installed = {},
    automatic_installation = false,
    handlers = {
        mypy = function ()
            null_ls.register(null_ls.builtins.diagnostics.mypy.with({
                extra_args = { "--ignore-missing-imports", "--check-untyped-defs" }
            }))
        end,
        pylint = function ()
            null_ls.register(null_ls.builtins.diagnostics.pylint.with({
                extra_args = { "--disable=import-error,too-few-public-methods,unused-import,unused-argument" }
            }))
        end,
        pydocstyle = function ()
            null_ls.register(null_ls.builtins.diagnostics.pydocstyle.with({
                extra_args = { "--ignore=D10,D203" }
            }))
        end,
        cpplint = function ()
            null_ls.register(null_ls.builtins.diagnostics.cpplint.with({
                args = { "--filter=-legal/copyright", "$FILENAME" }
            }))
        end,
        clang_format = function ()
            null_ls.register(null_ls.builtins.formatting.clang_format.with({
                extra_args = { "--style", "file:"..os.getenv("HOME").."/.config/nvim/files/clang-format" }
            }))
        end,
        sql_formatter = function ()
            null_ls.register(null_ls.builtins.formatting.sql_formatter.with({
                extra_args = { "-c", os.getenv("HOME").."/.config/nvim/files/sql-formatter.json" }
            }))
        end,
    },
    automatic_setup = true,
})

null_ls.setup({
    sources = {}
})
