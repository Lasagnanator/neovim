if not Langs.terraform then return {} end

local utils = require("core.utils")

Treesitter:update("terraform")
Mason:update({ "terraform-ls", "tflint" })
After:add(function()
    require("lspconfig").terraformls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)

require("lint").linters_by_ft.terraform = { "tflint" }

return {}
