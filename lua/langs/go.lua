if not Langs.go then return {} end

local utils = require("core.utils")

Treesitter:update({ "go", "gomod", "gosum", "gotmpl", "gowork" })
Mason:update({ "gopls", "delve", "gofumpt", "gomodifytags", "impl" })

require("lspconfig").gopls.setup({
    -- workaround for gopls not supporting semanticTokensProvider
    on_attach = function(client, bufnr)
        utils.on_attach(client, bufnr)
        if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                },
                range = true,
            }
        end
    end,
    capabilities = utils.set_capabilities(),
    settings = {
        gopls = {
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
            analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        }
    }
})

return {
    {
        "ray-x/go.nvim",
        opts = {
            lsp_cfg = false,
            lsp_inlay_hints = {
                enable = false,
            },
        },
        ft = { "go", "gomod", "gosum", "gotmpl", "gowork" },
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "leoluz/nvim-dap-go",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    }
}
