if not Langs.powershell then return {} end

---@type LazySpec
return {
    "TheLeoP/powershell.nvim",
    opts = {
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
    },
}
