if not Langs.yaml then return {} end

local utils = require("core.utils")

Treesitter:update("yaml")
Mason:update("yaml-language-server")

return {
    {
        "someone-stole-my-name/yaml-companion.nvim",
        config = function()
            local config = require("yaml-companion").setup({
                builtin_matchers = { kubernetes = { enabled = true } },
                lspconfig = {
                    on_attach = utils.on_attach,
                    capabilities = utils.set_capabilities(),
                    settings = {
                        redhat = { telemetry = { enabled = false } },
                        yaml = {
                            schemaStore = { enable = false },
                            schemas = require('schemastore').yaml.schemas(),
                        },
                    },
                }
            })
            require("lspconfig").yamlls.setup(config)
            -- TODO: add a keybind for the telescope extension
            require("telescope").load_extension("yaml_schema")
            vim.api.nvim_create_user_command("YamlCurrentSchema", function()
                local schema = require("yaml-companion").get_buf_schema(0)
                if schema.result[1].name == "none" then
                    print("Current schema: none")
                end
                print("Current schema: " .. schema.result[1].name)
            end, {})
        end,
        ft = { "yaml" },
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    }
}
