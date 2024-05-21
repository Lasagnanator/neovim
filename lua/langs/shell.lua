if not Langs.shell then return {} end

local utils = require("core.utils")

Treesitter:update({ "bash", "awk" })
Mason:update({ "bash-language-server", "beautysh", "awk-language-server" })

require("lspconfig").bashls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true
})

require("lspconfig").awk_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true
})

require("conform").formatters_by_ft.sh = { "beautysh" }

return {}
