if not Langs.java then return {} end

local utils = require("core.utils")

Treesitter:update({ "java", "groovy", "xml" })
Mason:update("gradle-language-server")

require("lspconfig").gradle_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

-- TODO: add bindings for nvim-java commands

return {
    {
        "nvim-java/nvim-java",
        config = function()
            require("java").setup()
            require("lspconfig").jdtls.setup({
                on_attach = utils.on_attach,
                capabilities = utils.set_capabilities(),
                settings = {
                    java = {
                        signatureHelp = { enabled = true },
                        contentProvider = { preferred = "fernflower" } -- NOTE: not sure is mandatory
                    }
                },
            })
        end,
        ft = "java",
        dependencies = {
            "nvim-java/lua-async-await",
            "nvim-java/nvim-java-refactor",
            "nvim-java/nvim-java-core",
            "nvim-java/nvim-java-test",
            "nvim-java/nvim-java-dap",
            "MunifTanjim/nui.nvim",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
    }
}
