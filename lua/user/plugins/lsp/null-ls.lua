return {
    {
        "jay-babu/mason-null-ls.nvim", -- Bridge the gap between Mason and null-ls
        lazy = false,
        opts = {
            ensure_installed = {},
            automatic_installation = false,
            automatic_setup = true,
        },
        config = function(_, opts)
            local mason_null_ls = require("mason-null-ls")
            local null_ls = require("null-ls")

            local overrides = {
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
            opts.handlers = overrides
            mason_null_ls.setup(opts)
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim", -- Enable linters and formatters to use the LSP client
        lazy = false,
        config = true,
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}
