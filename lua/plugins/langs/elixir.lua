-- BUG: dead code
if not Langs.elixir then return {} end

---@type LazySpec
return {
    "elixir-tools/elixir-tools.nvim",
    -- TODO: when the support to Expert is added, try the plugin again
    enabled = false,
    branch = "main",
    config = function()
        require("elixir").setup({
            nextls = { enable = false },
            elixirls = { enable = true },
            projectionist = { enable = false },
        })
    end,
    ft = "elixir",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
