--<< MASON >>--

--<< Protected calls
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
    return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

--<< Mason settings
mason.setup({
    ui = {
        -- border = "single",
        icons = {
            package_installed = " ",
            package_pending = "➜ ",
            package_uninstalled = " "
        }
    }
})

--<< On-attach function
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)

    -- Vars
    local keymap  = vim.keymap.set
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Mappings
    keymap("n", "<Leader>le",  vim.diagnostic.open_float,                    bufopts)
    keymap("n", "<A-[>",       vim.diagnostic.goto_prev,                     bufopts)
    keymap("n", "<A-]>",       vim.diagnostic.goto_next,                     bufopts)
    keymap("n", "<Leader>lr",  vim.lsp.buf.rename,                           bufopts)
    keymap("n", "<Leader>ld",  function ()
        vim.lsp.buf.definition({
            reuse_win = true,
        })
    end, bufopts)
    keymap("n", "<Leader>li",  vim.lsp.buf.hover,                            bufopts)
    keymap("n", "<Leader>lc",  vim.lsp.buf.code_action,                      bufopts)
    -- keymap("n", "<Leader>ls",  vim.lsp.buf.references,                       bufopts)
    keymap("n", "<Leader>lt",  "<Cmd>Trouble<CR>",                           bufopts)
    keymap("n", "<Leader>lwa", vim.lsp.buf.add_workspace_folder,             bufopts)
    keymap("n", "<Leader>lwr", vim.lsp.buf.remove_workspace_folder,          bufopts)
    keymap("n", "<Leader>lwl", function ()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap("n", "<Leader>lpp", function ()
        vim.lsp.buf.format ({
            async = true
        })
    end, bufopts)
end

--<< Mason-lsp settings
mason_lsp.setup({
    ensure_installed = { "bashls", "lua_ls" }, -- If not found, download and install declared LSPs; Python uses "pylsp" "pyright"
})

--<< LSP servers setup (handlers)
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
    ["pylsp"] = function ()
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
    ["yamlls"] = function ()
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
})

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
    return
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
    return
end

mason_null_ls.setup({
    ensure_installed = {},
    automatic_installation = false,
    handlers = {
        mypy = function ()
            null_ls.register(null_ls.builtins.diagnostics.mypy.with({
                extra_args = { "--ignore-missing-imports", "--check-untyped-defs" }
            }))
        end,
        pylint = function ()
            null_ls.register(null_ls.builtins.diagnostics.pylint.with({
                extra_args = { "--disable=import-error,too-few-public-methods" }
            }))
        end,
        pydocstyle = function ()
            null_ls.register(null_ls.builtins.diagnostics.pydocstyle.with({
                extra_args = { "--ignore=D10,D203" }
            }))
        end,
        cpplint = function ()
            null_ls.register(null_ls.builtins.diagnostics.cpplint.with({
                args = { "--filter=-legal/copyright", "$FILENAME" }
            }))
        end,
        clang_format = function ()
            null_ls.register(null_ls.builtins.formatting.clang_format.with({
                extra_args = { "--style", "{IndentWidth: 4}" }
            }))
        end,
    },
    automatic_setup = true,
})

null_ls.setup({
    sources = {}
})


-- Disable warning in C/C++ LSP
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
