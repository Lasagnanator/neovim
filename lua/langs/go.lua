if not Langs.go then return {} end

local utils = require("core.utils")

Treesitter:update({ "go", "gomod", "gosum", "gotmpl", "gowork" })
Mason:update({ "gopls", "delve" })

require("lspconfig").gopls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
    settings = {
        gopls = {
            -- TODO: check which options should be disabled
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            }
        }
    }
})

return {
    {
        "ray-x/go.nvim",
        config = function ()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod", "gosum", "gotmpl", "gowork" },
        -- build = ":lua require('go.install').update_all_sync()", -- if you need to install/update all binaries
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "leoluz/nvim-dap-go",
        config = function (_, opts)
            require("dap-go").setup(opts)
        end,
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    }
}
