if not Langs.clang then return {} end

local utils = require("core.utils")

Treesitter:update({ "c", "cpp" })
Mason:update({ "clangd", "codelldb", "cpplint", "clang-format" })
After:add(function()
    require("lspconfig").clangd.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities({
            offsetEncoding = "UTF-16",
        }),
    })

    require("lint").linters.cpplint.args = { "--filter=-legal/copyright", "$FILENAME" }
    require("lint").linters_by_ft.c = { "cpplint" }
    require("lint").linters_by_ft.cpp = { "cpplint" }

    require("conform").formatters.clang_format = {
        command = "clang-format",
        append_args = {
            "--style",
            "file:" .. os.getenv("HOME") .. "/.config/nvim/files/clang-format",
        }
    }
    require("conform").formatters["clang-format"] = {
        append_args = {
            "--style",
            "file:" .. os.getenv("HOME") .. "/.config/nvim/files/clang-format",
        }
    }
    require("conform").formatters_by_ft.c = { "clang-format" }
    require("conform").formatters_by_ft.cpp = { "clang-format" }
end)

-- TODO: setup codelldb
return {}
