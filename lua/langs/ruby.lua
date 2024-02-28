if not Langs.ruby then return {} end

local utils = require("core.utils")

Mason:update({ "solargraph", "rubocop" })

require("lspconfig").solargraph.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("lint").linters_by_ft.ruby = { "rubocop" }

require("conform").formatters_by_ft.ruby = { "rubocop" }

return {
    {
        "suketa/nvim-dap-ruby",
        config = true
    }
}
