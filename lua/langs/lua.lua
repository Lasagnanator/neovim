if not Langs.lua then return {} end

local utils = require("core.utils")

Mason:update("lua-language-server")

if Langs.nvim then require("neodev").setup() end

require("lspconfig").lua_ls.setup({
    -- on_attach = utils.on_attach,
    on_attach = function(client, bufnr)
        utils.on_attach(client, bufnr)
        require("lsp-inlayhints").on_attach(client, bufnr)
        require("lsp-inlayhints").show()
    end,
    capabilities = utils.set_capabilities(),
    on_new_config = function(client)
        -- if vim.fn.expand('%:p'):match("/awesome/") then
        if vim.api.nvim_buf_get_name(0):match("/awesome/") then
            for _, val in ipairs({ "awesome", "client", "screen" }) do
                table.insert(client.settings.Lua.diagnostics.globals, val)
            end
        end
    end,
    settings = {
        Lua = {
            telemetry = {
                enable = false,
            },
        },
    },
})


return {}
