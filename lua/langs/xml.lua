if not Langs.xml.enabled then return {} end

local utils = require("core.utils")

Treesitter:update({ "xml" })
Mason:update({ "lemminx", "xmlformatter" })
After:add(function ()
    require("lspconfig").lemminx.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })

    require("conform").formatters_by_ft.xml = { "xmlformatter" }
end)

return {}
