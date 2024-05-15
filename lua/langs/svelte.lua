if not Langs.svelte then return {} end

local utils = require("core.utils")

Treesitter:update("svelte")
Mason:update("svelte-language-server") -- check if eslint and prettier are useful

require("lspconfig").svelte.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

-- require("lint").linters_by_ft.svelte = { "eslint_d" }

-- require("conform").formatters_by_ft.eslint = { "prettierd" }

return {}
