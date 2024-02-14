if not Langs.nginx then return end

local utils = require("core.utils")

Mason:update({ "nginx-language-server" })

require("lspconfig").nginx_language_server.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true
})

return {}
