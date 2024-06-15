if not Langs.ansible then return {} end

local utils = require("core.utils")

Treesitter:update("yaml")
Mason:update("ansible-language-server")

require("lspconfig").ansiblels.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        ansible = {
            validation = {
                lint = { enabled = false }
            },
        },
    },
})


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.yml", "*.yaml", "*.ansible" },
    callback = function ()
        if vim.bo.ft == "yaml.ansible" then
            vim.cmd("TSBufDisable indent highlight")
        end
    end
})


return {
    {
        "mfussenegger/nvim-ansible",
        ft = { "yaml", "yaml.ansible" }
    }
}
