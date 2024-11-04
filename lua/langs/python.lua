---@diagnostic disable: missing-fields
if not Langs.python then return {} end

local utils = require("core.utils")

Treesitter:update("python")
Mason:update({ "debugpy", "basedpyright", "black" })
After:add(function()
    require("lspconfig").basedpyright.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "recommended",
                }
            }
        }
    })

    require("conform").formatters_by_ft.python = { "black" }
end)

---@type LazySpec
return {
    -- TODO: configure Molten
    -- TODO: check dependencies on launch
    -- TODO: test with real Jupyter notebook
    {
        "benlubas/molten-nvim",
        cond = Langs.jupyter,
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        init = function()
            -- this is an example, not a default. Please see the readme for more configuration options
            vim.g.molten_output_win_max_height = 12
        end,
        dependencies = {
            "3rd/image.nvim"
        }
    },
}
