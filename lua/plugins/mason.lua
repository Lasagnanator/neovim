return {
    {
        "williamboman/mason.nvim", -- Frontend for tools like LSPs, debuggers, linters and formatters
        opts = {
            ui = {
                -- border = "single",
                icons = {
                    package_installed = "",
                    package_pending = "➜",
                    package_uninstalled = ""
                }
            },
            registries = {
                "github:nvim-java/mason-registry",
                "github:mason-org/mason-registry",
            },
        },
        init = function() require("keybinds.plugins.mason"):set() end
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- Automate the installation of language tools from Mason
        opts = {
            ensure_installed = Mason.tools
        },
        dependencies = { "williamboman/mason.nvim" }
    },
}
