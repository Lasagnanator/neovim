if not Langs.terraform then return {} end

local utils = require("core.utils")

Treesitter:update("terraform")
Mason:update({ "terraform-ls", "tflint" })

require("lspconfig").terraformls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true,
})

require("lint").linters_by_ft.terraform = { "tflint" }

return {}
