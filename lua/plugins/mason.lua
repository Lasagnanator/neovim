return {
    {
        "williamboman/mason.nvim",
        opts = { registries = { "github:mason-org/mason-registry" } },
        init = function() require("keybinds.plugins.mason"):set() end
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = { ensure_installed = Mason.tools },
        dependencies = { "williamboman/mason.nvim" }
    },
}
