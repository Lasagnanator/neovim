if not Langs.lua then return {} end

local utils = require("core.utils")

-- table.insert(Mason, "clangd")
-- table.insert(Mason, "codelldb")
-- table.insert(Mason, "cpplint")

Mason = utils.list_append(Mason, { "clangd", "codelldb", "cpplint" })

require("lspconfig").clangd.setup({
    on_attach = utils.on_attach(),
    capabilities = utils.set_capabilities({
        offsetEncoding = "UTF-16",
    }),
})

-- TODO: setup codelldb and cpplint

return {}
