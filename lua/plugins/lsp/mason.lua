local M = {}


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


local function set_capabilities(overwrite)
    local overwrite_capabilities = overwrite or {}
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = {}
    local function merge_capabilities(original, merge)
        local merged = original
        for cap_key, cap_value in pairs(merge) do
            merged[cap_key] = cap_value
        end
        return merged
    end
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities = merge_capabilities(capabilities, cmp_capabilities)
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    capabilities = merge_capabilities(capabilities, overwrite_capabilities)
    return capabilities
end


M.set_handlers = function()
    local lspconfig = require("lspconfig")
    local handlers  = {
        -- Default handler
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = on_attach,
                capabilities = set_capabilities(),
                -- single_file_support = true
            })
        end,
        -- Personalized handlers
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = set_capabilities(),
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
                capabilities = set_capabilities(),
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
                capabilities = set_capabilities(),
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
                capabilities = set_capabilities(),
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
                on_attach = on_attach,
                capabilities = set_capabilities(),
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
                on_attach = function(_, bufnr)
                    vim.cmd("TSBufDisable indent")
                    vim.cmd("TSBufDisable highlight")
                    vim.cmd("TSBufDisable incremental_selection")
                    on_attach(_, bufnr)
                end,
                capabilities = set_capabilities(),
                settings = {
                    ansible = {
                        validation = {
                            lint = { enabled = false }
                        },
                    },
                },
            })
        end,
        ["sqlls"] = function()
            lspconfig.sqlls.setup({
                on_attach = on_attach,
                capabilities = set_capabilities(),
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
                capabilities = set_capabilities({
                    offsetEncoding = "UTF-16",
                }),
            })
        end,
        ["volar"] = function()
            lspconfig.volar.setup({
                on_attach = function(_, bufnr)
                    exclude_client("tsserver")
                    on_attach(_, bufnr)
                end,
                capabilities = set_capabilities(),
                root_dir = lspconfig.util.root_pattern("**.vue"),
                single_file_support = false,
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue",
                    "json" },
            })
        end
    }
    return handlers
end

return M
