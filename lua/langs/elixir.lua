if not Langs.elixir.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("elixir")

return {
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        ft = "elixir",
        config = function()
            require("elixir").setup {
                nextls = { enable = false },
                enable = true,
                elixirls = {
                    enable = true,
                    on_attach = utils.on_attach,
                },
                projectionist = { enable = false }
            }
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    }
}
