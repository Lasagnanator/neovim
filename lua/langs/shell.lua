if not Langs.shell then return {} end

local utils = require("core.utils")

Treesitter:update({ "bash", "awk" })

-- Conditional installation for Tumbleweed bug
if vim.fn.executable("awk-language-server") then
    Mason:update({ "bash-language-server", "shfmt", "beautysh" })
else
    Mason:update({ "bash-language-server", "shfmt", "beautysh", "awk-language-server" })
end

require("lspconfig").bashls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true
})

require("lspconfig").awk_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true
})

require("conform").formatters_by_ft.sh = { "beautysh" }

return {}
