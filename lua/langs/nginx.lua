if not Langs.nginx.enabled then return {} end

local utils = require("core.utils")

Mason:update({ "nginx-language-server" })
After:add(function()
    require("lspconfig").nginx_language_server.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        single_file_support = true
    })
end)

return {}
