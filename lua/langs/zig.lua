---@diagnostic disable: missing-fields
if not Langs.zig.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("zig")
Mason:update({ "zls", "codelldb" })
After:add(function()
    require("lspconfig").zls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
    })

    vim.g.zig_fmt_autosave = 0
end)

-- TODO: evaluate https://github.com/NTBBloodbath/zig-tools.nvim
return {}
