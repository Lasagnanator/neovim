if not Langs.ruby.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("ruby")
-- NOTE: ruby-lsp should be better, but right now is broken (does not install or start, not clear)
Mason:update({ "solargraph" })
After:add(function()
    require("lspconfig").solargraph.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        single_file_support = true
    })

    -- require("lspconfig").ruby_ls.setup({
    --     on_attach = utils.on_attach,
    --     capabilities = utils.set_capabilities(),
    --     single_file_support = true
    -- })

    -- require("lspconfig").rubocop.setup({
    --     on_attach = utils.on_attach,
    --     capabilities = utils.set_capabilities(),
    --     single_file_support = true
    -- })

    -- require("lint").linters_by_ft.ruby = { "rubocop" }

    -- require("conform").formatters_by_ft.ruby = { "rubocop" }
end)

return {
    {
        "suketa/nvim-dap-ruby",
        config = true
    }
}
