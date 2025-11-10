if not Langs.obsidian then return {} end

local utils = require("core.utils")
utils.generate_from_template("obsidian.lua", "Missing default Obsidian configuration, generated from template")

local function set_vault_events()
    local configuration = require("configurations.obsidian")
    local events = {}
    for _, vault in ipairs(configuration) do
        table.insert(events, "BufReadPre " .. vim.fn.expand(vault.path) .. "/*.md")
        table.insert(events, "BufNewFile " .. vim.fn.expand(vault.path) .. "/*.md")
    end
    return events
end

---@type LazySpec
return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        opts = {
            workspaces = require("configurations.obsidian"),
        },
        config = function(_, opts)
            if vim.fn.has("wsl") == 1 then
                if vim.fn.executable("wsl-open") == 0 then
                    vim.notify("Missing wsl-open!")
                    return
                end
            end
            require("obsidian").setup(opts)
        end,
        event = set_vault_events(),
        dependencies = {
            "saghen/blink.cmp",
            "ibhagwan/fzf-lua",
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
