---@type LazySpec
return {
    {
        "williamboman/mason.nvim",
        opts = { registries = { "github:mason-org/mason-registry" } },
        keys = require("keybinds.plugins.mason"):to_lazy(),
        lazy = false,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = { ensure_installed = Mason.tools },
        dependencies = { "williamboman/mason.nvim" },
    },
}
