if not Langs.ansible then return {} end

local utils = require("core.utils")

Treesitter:update("yaml")
Mason:update("ansible-language-server")

require("lspconfig").ansiblels.setup({
    on_attach = function(_, bufnr)
        utils.on_attach(_, bufnr)
        -- utils.exclude_client("yamlls")
        vim.cmd("TSBufDisable indent")
        vim.cmd("TSBufDisable highlight")
        vim.cmd("TSBufDisable incremental_selection")
    end,
    capabilities = utils.set_capabilities(),
    settings = {
        ansible = {
            validation = {
                lint = { enabled = false }
            },
        },
    },
})


return {
    {
        "mfussenegger/nvim-ansible",
        ft = { "yaml", "yaml.ansible" }
    }
}
