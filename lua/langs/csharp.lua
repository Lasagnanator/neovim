---@diagnostic disable: missing-fields
if not Langs.csharp.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("c_sharp")
Mason:update({ "omnisharp", "netcoredbg" })
After:add(function()
    require("lspconfig").omnisharp.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        cmd = { "omnisharp" },
        handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
            ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
            ["textDocument/references"] = require('omnisharp_extended').references_handler,
            ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
        }
    })
end)

return {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = { "cs" }
}
