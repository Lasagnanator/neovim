if not Langs.lua then return {} end

local utils = require("core.utils")

Treesitter:update({ "c", "cpp" })
Mason:update({ "clangd", "codelldb", "cpplint" })

require("lspconfig").clangd.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities({
        offsetEncoding = "UTF-16",
    }),
})

-- TODO: setup codelldb and cpplint
-- cpplint:         args = { "--filter=-legal/copyright", "$FILENAME" }
-- clang_format:    extra_args = { "--style", "file:" .. os.getenv("HOME") .. "/.config/nvim/files/clang-format" } }
return {}
