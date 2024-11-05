---@diagnostic disable-next-line: unused-function
local function disabled_langs()
    if vim.bo.ft == "yaml.ansible" then
        return true
    end
    return false
end

return {
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
    priority = Priority.treesitter,
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = Treesitter.parsers,
        highlight = {
            enable = true,
            -- disable = disabled_langs,
        },
        indent = {
            enable = true,
            -- disable = disabled_langs,
        },
        incremental_selection = {
            enable = true,
            keymaps = require("keybinds.plugins.treesitter").incremental_selection,
        },
    },
    dependencies = {
        {
            "nushell/tree-sitter-nu",
            enabled = Langs.nu.enabled,
        }
    },
}
