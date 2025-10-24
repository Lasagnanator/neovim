if not Langs.markdown then return {} end

---@type LazySpec
return {
    {
        "OXY2DEV/markview.nvim",
        version = "*",
        opts = {
            preview = {
                icon_provider = "mini",
                modes = { "n", "i", "no", "c" },
                hybrid_modes = { "i" },
            },
        },
        lazy = false,
        dependencies = {
            "saghen/blink.cmp",
            "nvim-mini/mini.icons",
        },
    },
    {
        "brianhuster/live-preview.nvim",
        version = "*",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
    },
}
