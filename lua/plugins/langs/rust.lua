if not Langs.rust then return {} end

---@type LazySpec
return {
    {
        "mrcjkb/rustaceanvim",
        ft = "rust",
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = require("core.utils").on_attach,
                    capabilities = require("core.utils").set_capabilities(),
                },
            }
        end,
    },
    {
        "saecki/crates.nvim",
        ft = "toml",
    },
}
