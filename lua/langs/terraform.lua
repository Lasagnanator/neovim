if not Langs.terraform then return {} end

local utils = require("core.utils")

Mason:update({ "terraform-ls", "tflint" })

require("lspconfig").terraform_lsp.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("lint").linters_by_ft.terraform = { "tflint" }

return {}
