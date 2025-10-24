if not Langs.java then return {} end

---@type LazySpec
return {
    "nvim-java/nvim-java",
    version = "*",
    config = function()
        require("java").setup({
            jdk = {
                auto_install = false,
            },
        })
        require("lspconfig").jdtls.setup({})
    end,
    dependencies = { "mfussenegger/nvim-dap" },
}
