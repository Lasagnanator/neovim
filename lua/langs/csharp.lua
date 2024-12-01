---@diagnostic disable: missing-fields
if not Langs.csharp.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("c_sharp")
local mason_tools = { "netcorebg" }
if vim.fn.has("win32") == 1 then
    table.insert(mason_tools, "omnisharp")
else
    table.insert(mason_tools, "omnisharp-mono")
end
Mason:update(mason_tools)
After:add(function ()
    require("lspconfig").omnisharp.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities()
    })
end)

return {}
