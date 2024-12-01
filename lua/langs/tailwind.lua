---@diagnostic disable: missing-fields
if not Langs.tailwind.enabled then return {} end

local utils = require("core.utils")

Mason:update("tailwindcss-language-server")

return {
    "luckasRanarison/tailwind-tools.nvim",
    -- XXX: not sure if needed
    -- build = ":UpdateRemotePlugins",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
    }
}
