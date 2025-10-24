---@type LazySpec
return {
    "cenk1cenk2/schema-companion.nvim",
    cond = Langs.yaml or Langs.json or Langs.toml,
    branch = "main",
    config = function() require("schema-companion").setup({}) end,
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
}
