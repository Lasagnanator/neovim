if not Langs.shell then return {} end

local utils = require("core.utils")

table.insert(Mason, "bash-language-server")
table.insert(Mason, "beautysh")

require("lspconfig").bashls.setup({
    on_attach = utils.on_attach(),
    capabilities = utils.set_capabilities(),
    single_file_support = true
})

-- TODO: setup beautysh

return {}
