---@type LazySpec
return {
    {
        "williamboman/mason.nvim",
        version = "*",
        opts = {
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "➜",
                    package_uninstalled = "",
                },
            },
        },
        registries = {
            registries = { "github:mason-org/mason-registry" },
        },
        opts_extend = { "registries" },
        lazy = false,
        keys = require("keybinds.plugins.mason"):to_lazy(),
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        branch = "main",
        opts = { ensure_installed = Mason.tools },
        dependencies = { "williamboman/mason.nvim" },
    },
}
