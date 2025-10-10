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
        init = function ()
            vim.api.nvim_create_augroup("mason", { clear = true })
            vim.api.nvim_create_autocmd("VimEnter", {
                desc = "Install missing tools with Mason",
                group = "mason",
                command = "MasonToolsInstall"
            })
        end
    },
}
