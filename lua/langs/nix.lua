if not Langs.nix then return {} end

local utils = require("core.utils")

Treesitter:update("nix")
Mason:update({ "nil", "nixpkgs-fmt" })

require("lspconfig").nil_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

require("conform").formatters_by_ft.nix = { "nixpkgs_fmt" }

return {}
