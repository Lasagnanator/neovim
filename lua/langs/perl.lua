if not Langs.perl then return {} end

local utils = require("core.utils")

Treesitter:update("perl")
Mason:update({ "perlnavigator", "perl-debug-adapter" })

require("lspconfig").perlnavigator.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true,
})

return {}
