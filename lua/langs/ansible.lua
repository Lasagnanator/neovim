if not Langs.ansible then return {} end

local utils = require("core.utils")

Mason:update("ansible-language-server")

require("lspconfig").ansiblels.setup({
    on_attach = function(_, bufnr)
        vim.cmd("TSBufDisable indent")
        vim.cmd("TSBufDisable highlight")
        vim.cmd("TSBufDisable incremental_selection")
        utils.on_attach(_, bufnr)
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
