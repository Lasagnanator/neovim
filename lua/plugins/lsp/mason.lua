local function on_attach(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    Utils.set_keybinds(Keybinds.lsp(bufopts).on_attach)
end

local function exclude_client(client_name)
    local clients = vim.lsp.get_active_clients()
    for _, client in pairs(clients) do
        if client.name == client_name then
            vim.lsp.get_client_by_id(client.id).stop()
        end
    end
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local new_client = vim.lsp.get_client_by_id(args.data.client_id)
            if new_client.name == client_name then
                new_client.stop()
            end
        end
    })
end

return {
    {
        "williamboman/mason.nvim", -- Automate installation of LSP servers
        opts = {
            ui = {
                -- border = "single",
                icons = {
                    package_installed = "",
                    package_pending = "➜",
                    package_uninstalled = ""
                }
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",               -- Bridges the two plugins
        opts = {
            ensure_installed = { "bashls", "lua_ls" },     -- If not found, download and install declared LSPs; Python uses "pylsp" "pyright"
        },
        config = function(_, opts)
            local mason_lsp = require("mason-lspconfig")
            local lspconfig = require("lspconfig")

            mason_lsp.setup(opts)

            mason_lsp.setup_handlers({
                -- Default handler
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                        single_file_support = true
                    })
                end,
                -- Personalized handlers
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        on_attach = on_attach,
                        on_new_config = function(client)
                            -- if vim.fn.expand('%:p'):match("/awesome/") then
                            if vim.api.nvim_buf_get_name(0):match("/awesome/") then
                                for _, val in ipairs({ "awesome", "client", "screen" }) do
                                    table.insert(client.settings.Lua.diagnostics.globals, val)
                                end
                            end
                        end,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        on_attach = on_attach,
                        settings = {
                            python = {
                                analysis = {
                                    autoSearchPaths = true,
                                    diagnosticMode = "workspace",
                                    useLibraryCodeForTypes = true,
                                    typeCheckingMode = "off", -- Options: off, basic, strict
                                },
                            },
                        },
                    })
                end,
                ["pylsp"] = function()
                    lspconfig.pylsp.setup({
                        on_attach = on_attach,
                        settings = {
                            pylsp = {
                                plugins = {
                                    pycodestyle = {
                                        ignore = { "E501" }
                                    },
                                },
                            }
                        }
                    })
                end,
                ["jsonls"] = function()
                    lspconfig.jsonls.setup({
                        on_attach = on_attach,
                        settings = {
                            json = {
                                schemas = require("schemastore").json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    })
                end,
                ["yamlls"] = function()
                    lspconfig.yamlls.setup({
                        settings = {
                            yaml = {
                                schemaStore = { enable = false },
                                schemas = require('schemastore').yaml.schemas(),
                            },
                        },
                    })
                end,
                ["ansiblels"] = function()
                    lspconfig.ansiblels.setup({
                        on_attach = on_attach,
                        settings = {
                            ansible = {
                                validation = {
                                    lint = { enabled = true }
                                },
                            },
                        },
                    })
                end,
                ["sqlls"] = function()
                    lspconfig.sqlls.setup({
                        on_attach = on_attach,
                        single_file_support = true,
                        filetypes = { "sql", "mysql" },
                        settings = {
                            sqlLanguageServer = {
                                lint = {
                                    rules = {
                                        ["align-column-to-the-first"] = "error",
                                        ["column-new-line"] = "off",
                                        ["linebreak-after-clause-keyword"] = "off",
                                        ["reserved-word-case"] = { "error", "upper" },
                                        ["space-surrounding-operators"] = "error",
                                        ["where-clause-new-line"] = "off",
                                        ["align-where-clause-to-the-first"] = "error",
                                    },
                                },
                            },
                        },
                    })
                end,
                ["clangd"] = function()
                    lspconfig.clangd.setup({
                        on_attach = on_attach(),
                        capabilities = {
                            offsetEncoding = "UTF-16",
                        },
                    })
                end,
                ["volar"] = function()
                    lspconfig.volar.setup({
                        on_attach = function(_, bufnr)
                            exclude_client("tsserver")
                            on_attach(_, bufnr)
                        end,
                        root_dir = lspconfig.util.root_pattern("**.vue"),
                        single_file_support = false,
                        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue",
                            "json" },
                    })
                end
            })
        end,
    },
}
