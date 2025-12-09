if not Langs.http then return {} end

---@type LazySpec
return {
    "mistweaverco/kulala.nvim",
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>r",
      kulala_keymaps_prefix = "",
    },
    ft = { "http", "rest" },
}
