if not Langs.ocaml then return {} end

local utils = require("core.utils")

Treesitter:update({ "ocaml", "ocaml_interface" })
Mason:update("ocamlearlybird")
After:add(function ()
    require("lspconfig").ocamllsp.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })

    require("conform").formatters_by_ft.ocaml = { "ocamlformat" }
end)

return {}
