if not Langs.go then return {} end

---@type LazySpec
return {
    {
        "ray-x/go.nvim",
        opts = {
            lsp_cfg = false,
            lsp_inlay_hints = {
                enable = false,
            },
        },
        ft = { "go", "gomod", "gosum", "gotmpl", "gowork" },
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "leoluz/nvim-dap-go",
        config = function(_, opts) require("dap-go").setup(opts) end,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "TheNoeTrevino/no-go.nvim",
        opts = {
            identifiers = { "err", "error" },
        },
        ft = "go",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
