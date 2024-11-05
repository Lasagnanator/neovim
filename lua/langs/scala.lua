if not Langs.scala.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("scala")
After:add(function()
    require("dap").configurations.scala = {
        {
            type = "scala",
            request = "launch",
            name = "RunOrTest",
            metals = {
                runType = "runOrTestFile",
                --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
            },
        },
        {
            type = "scala",
            request = "launch",
            name = "Test Target",
            metals = {
                runType = "testTarget",
            },
        },
    }
end)

return {
    {
        "scalameta/nvim-metals",
        ft = { "scala", "sbt", "java" },
        opts = function()
            local metals_config = require("metals").bare_config()

            metals_config.on_attach = function(_, bufnr)
                require("metals").setup_dap()
                utils.on_attach(_, bufnr)
            end
            metals_config.capabilities = utils.set_capabilities()

            return metals_config
        end,
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = self.ft,
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "j-hui/fidget.nvim",
            "mfussenegger/nvim-dap",
        },
    }
}
