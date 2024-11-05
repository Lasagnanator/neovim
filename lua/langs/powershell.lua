if not Langs.powershell.enabled then return {} end

local utils = require("core.utils")

Mason:update("powershell-editor-services")

return {
    {
        "TheLeoP/powershell.nvim",
        opts = {
            bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
            on_attach = utils.on_attach,
            capabilities = utils.set_capabilities()
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap"
        }
    }
}
