if not Langs.csharp then return {} end

---@type LazySpec
return {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = { "cs" },
}
