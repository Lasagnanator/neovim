if not Langs.nvim then return {} end

---@type LazySpec
return {
    "folke/lazydev.nvim",
    branch = "main",
    opts = {
        library = {
            "lazy.nvim",
        },
    },
    ft = "lua",
}
