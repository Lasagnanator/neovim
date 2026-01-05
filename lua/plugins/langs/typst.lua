if not Langs.typst then return {} end

---@type LazySpec
return {
    "chomosuke/typst-preview.nvim",
    version = "*",
    config = true,
    ft = "typst",
}
