if not Langs.java then return {} end

---@type LazySpec
return {
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

            vim.lsp.config("jdtls", {
                cmd = {
                    "java",
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.level=ALL",
                    "-Xmx1G",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens",
                    "java.base/java.util=ALL-UNNAMED",
                    "--add-opens",
                    "java.base/java.lang=ALL-UNNAMED",
                    "-javaagent:" .. jdtls_path .. "/lombok.jar",
                    "-jar",
                    vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                    "-configuration",
                    jdtls_path .. "/config_linux",
                    "-data",
                    vim.env.HOME .. "/.cache/jdtls/config",
                },
                root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
                settings = {
                    java = {
                        signatureHelp = { enabled = true },
                        extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
                        -- TODO: Understand this keys effect
                        -- maven = {
                        --     downloadSources = true,
                        -- },
                        -- referencesCodeLens = {
                        --     enabled = true,
                        -- },
                        -- references = {
                        --     includeDecompiledSources = true,
                        -- },
                        inlayHints = {
                            parameterNames = {
                                enabled = "all", -- literals, all, none
                            },
                        },
                        format = {
                            enabled = true,
                        },
                    },
                },
            })
            vim.lsp.enable("jdtls")
        end,
    },
}
