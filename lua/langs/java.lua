if not Langs.java then return {} end

Treesitter:update({ "java", "groovy", "xml" })

-- TODO: add bindings for nvim-java commands

return {
    {
        "nvim-java/nvim-java",
        config = function ()
            require("java").setup()
            require("lspconfig").jdtls.setup({})
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
    -- NOTE: use in case nvim-java does not work
    -- {
    --     "mfussenegger/nvim-jdtls"
    -- },
    -- {
    --     "simaxme/java.nvim"
    -- }
}
