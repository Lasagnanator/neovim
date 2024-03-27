if not Langs.rust then return {} end

local utils = require("core.utils")

Treesitter:update("rust")
Mason:update({ "rust-analyzer", "codelldb" })

return {
    {
        "mrcjkb/rustaceanvim",
        ft = "rust",
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    -- on_attach = utils.on_attach,
                    on_attach = function(client, bufnr)
                        utils.on_attach(client, bufnr)
                        -- require("lsp-inlayhints").on_attach(client, bufnr)
                        -- require("lsp-inlayhints").show()
                    end,
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
