if not Langs.java then return {} end

local utils = require("core.utils")

Treesitter:update({ "java", "groovy", "xml" })
-- NOTE: installed with nvim-java
-- java-debug-adapter
-- java-test
-- jdtls
-- lombok-nightly
-- openjdk-17
Mason:update({ "jdtls", "java-debug-adapter", "java-test", "gradle-language-server" })

require("lspconfig").gradle_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

-- TODO: add bindings for nvim-java commands

return {
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
                pattern = "*.java",
                callback = function()
                    -- Test
                    print("Java detected!")

                    -- Code
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
                            -- '-javaagent:' .. vim.fn.stdpath("data") .. '/mason/packages/jdtls/lombok.jar',
                            '-jar',
                            -- vim.fn.glob(vim.fn.stdpath("data") .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
                            vim.fn.stdpath("data") .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar',
                            '-configuration', vim.fn.stdpath("data") .. '/nvim/mason/packages/jdtls/config_linux',
                            '-data', vim.fn.stdpath("data") ..
                        '/jdtls-workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
                        },
                        -- root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }), -- Old
                        root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }), -- Neovim >=0.10
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
                                    enabled = false,
                                },
                            },
                        },

                        init_options = {
                            bundles = {},
                        },
                    })
                end
            })
        end
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
    -- {
    --     "nvim-java/nvim-java",
    --     config = function()
    --         require("java").setup()
    --         require("lspconfig").jdtls.setup({
    --             on_attach = utils.on_attach,
    --             capabilities = utils.set_capabilities(),
    --             settings = {
    --                 java = {
    --                     signatureHelp = { enabled = true },
    --                     contentProvider = { preferred = "fernflower" } -- NOTE: not sure is mandatory
    --                 }
    --             },
    --         })
    --     end,
    --     ft = "java",
    --     dependencies = {
    --         "nvim-java/lua-async-await",
    --         "nvim-java/nvim-java-refactor",
    --         "nvim-java/nvim-java-core",
    --         "nvim-java/nvim-java-test",
    --         "nvim-java/nvim-java-dap",
    --         "MunifTanjim/nui.nvim",
    --         "neovim/nvim-lspconfig",
    --         "mfussenegger/nvim-dap",
    --         "williamboman/mason.nvim",
    --     },
    -- }
}
