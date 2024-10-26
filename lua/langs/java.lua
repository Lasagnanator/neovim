if not Langs.java then return {} end

local utils = require("core.utils")

Treesitter:update({ "java", "groovy", "xml" })
Mason:update({ "jdtls", "java-debug-adapter", "java-test", "gradle-language-server" })

require("lspconfig").gradle_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
                pattern = "*.java",
                callback = function()
                    local data = vim.fn.stdpath('data')
                    local jdtls_launcher = vim.fn.glob(data ..
                        '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar')
                    local jdtls_config = data .. '/mason/packages/jdtls/config_linux'
                    local java_debug = vim.fn.glob(data ..
                        '/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar')
                    local lombok = data .. '/mason/packages/jdtls/lombok.jar'
                    local workspace = data .. '/jdtls-workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

                    require("jdtls").start_or_attach({
                        cmd = {
                            'java',
                            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                            '-Dosgi.bundles.defaultStartLevel=4',
                            '-Declipse.product=org.eclipse.jdt.ls.core.product',
                            '-Dlog.protocol=true',
                            '-Dlog.level=ALL',
                            '-Xmx1g',
                            '--add-modules=ALL-SYSTEM',
                            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                            '-javaagent:' .. lombok,
                            '-jar', jdtls_launcher,
                            '-configuration', jdtls_config,
                            '-data', workspace
                        },
                        root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", 'pom.xml', 'build.gradle' }), -- Neovim >=0.10
                        on_attach = utils.on_attach,
                        settings = {
                            java = {
                                signatureHelp = { enabled = true },
                                extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
                                maven = {
                                    downloadSources = true,
                                },
                                referencesCodeLens = {
                                    enabled = true,
                                },
                                references = {
                                    includeDecompiledSources = true,
                                },
                                inlayHints = {
                                    parameterNames = {
                                        enabled = 'all', -- literals, all, none
                                    },
                                },
                                format = {
                                    enabled = true,
                                },
                            },
                        },

                        init_options = {
                            bundles = {
                                java_debug
                            },
                        },
                    })
                end
            })
        end,
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
        }
    },
    {
        "simaxme/java.nvim",
        config = true,
        ft = "java",
        dependencies = {
            "nvim-tree/nvim-tree.lua",
            "L3MON4D3/LuaSnip",
            "mfussenegger/nvim-jdtls"
        }
    }
}
