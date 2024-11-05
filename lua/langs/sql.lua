if not Langs.sql.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("sql")
Mason:update({ "sqlls", "sql-formatter" })
After:add(function()
    require("lspconfig").sqlls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        single_file_support = true,
        filetypes = { "sql", "mysql" },
        settings = {
            sqlLanguageServer = {
                lint = {
                    rules = {
                        ["align-column-to-the-first"] = "error",
                        ["column-new-line"] = "off",
                        ["linebreak-after-clause-keyword"] = "off",
                        ["reserved-word-case"] = { "error", "upper" },
                        ["space-surrounding-operators"] = "error",
                        ["where-clause-new-line"] = "off",
                        ["align-where-clause-to-the-first"] = "error",
                    },
                },
            },
        },
    })

    require("conform").formatters.sql_formatter = {
        prepend_args = { "-c", os.getenv("HOME") .. "/.config/nvim/files/sql-formatter.json" }
    }
    require("conform").formatters_by_ft.sql = { "sql_formatter" }
end)

return {
    {
        "kndndrj/nvim-dbee",
        config = function()
            require("dbee").setup()
        end,
        keys = require("keybinds.plugins.dbee"):to_lazy(),
        lazy = false,
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
}
