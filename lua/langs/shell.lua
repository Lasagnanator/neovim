if not Langs.shell then return {} end

local utils = require("core.utils")

Treesitter:update({ "bash", "awk" })

local mason_tools = { "bash-language-server", "shfmt", "shellcheck" }

-- Conditional installation for Tumbleweed bug
if not vim.fn.executable("awk-language-server") then
    table.insert(mason_tools, "awk-language-server")
end

Mason:update(mason_tools)

require("lspconfig").bashls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    cmd = { "bash-language-server", "start" },
})

require("lspconfig").awk_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    single_file_support = true
})

require("lint").linters_by_ft = { "shellcheck" }
require("conform").formatters_by_ft.sh = { "shfmt" }

return {}
