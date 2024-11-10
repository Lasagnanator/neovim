---@diagnostic disable: missing-fields
if not Langs.shell.enabled then return {} end

local utils = require("core.utils")

Treesitter:update({ "bash", "awk" })
local mason_tools = { "bash-language-server", "shfmt", "shellcheck" }
-- Conditional installation for Tumbleweed bug
if vim.fn.executable("awk-language-server") == 0 then
    table.insert(mason_tools, "awk-language-server")
end
Mason:update(mason_tools)
After:add(function()
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

    -- TODO: remove, duplicate errors with bashls
    -- require("lint").linters_by_ft.sh = { "shellcheck" }
    require("conform").formatters_by_ft.sh = { "shfmt" }
end)

return {}
