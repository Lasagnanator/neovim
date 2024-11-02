if not Langs.obsidian then return {} end

if not Langs.markdown then
    vim.notify("Enable markdown language to work with Obsidian")
    return {}
end

local utils = require("core.utils")
utils.generate_from_template("obsidian.lua", "Missing default Obsidian configuration, generated from template")

local function set_vaults_events()
    local configuration = require("configurations.obsidian")
    local events = {}
    for _, vault in ipairs(configuration) do
        table.insert(events, "BufReadPre " .. vim.fn.expand(vault.path) .. "/*.md")
        table.insert(events, "BufNewFile " .. vim.fn.expand(vault.path) .. "/*.md")
    end
    return events
end

return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        opts = {
            workspaces = require("configurations.obsidian"),
            completion = {
                nvim_cmp = true,
                min_chars = 0,
            },
            disable_frontmatter = true,
            ui = {
                enable = false,
            }
        },
        config = function(_, opts)
            if utils.is_wsl() then
                if vim.fn.executable("wsl-open") == 0 then
                    vim.notify("Missing wsl-open!")
                    return
                end
            end
            require("obsidian").setup(opts)
        end,
        event = set_vaults_events(),
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
        }
    }
}
