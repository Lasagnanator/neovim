if not Langs.rust.enabled then return {} end

local utils = require("core.utils")

Treesitter:update({ "rust", "toml" })
Mason:update("codelldb")

return {
    {
        "mrcjkb/rustaceanvim",
        ft = "rust",
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = utils.on_attach,
                    capabilities = utils.set_capabilities(),
                }
            }
        end,
    },
    {
        "saecki/crates.nvim",
        ft = "toml"
    },
}
