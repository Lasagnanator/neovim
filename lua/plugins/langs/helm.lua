if not Langs.helm then return {} end

---@type LazySpec
return {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
}
