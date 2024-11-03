if not Langs.svelte then return {} end

local utils = require("core.utils")

Treesitter:update("svelte")
Mason:update({ "svelte-language-server", --[[ "prettierd" ]] }) -- check if eslint and prettier are useful
After:add(function()
    require("lspconfig").svelte.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })
end)

-- require("conform").formatters_by_ft.eslint = { "prettierd" }

return {}
