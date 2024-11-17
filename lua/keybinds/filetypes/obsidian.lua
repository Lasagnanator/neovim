local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

local function open_obsidian_vault()
    local config = require("configurations.obsidian")
    -- local vaults = {}
    -- for _, vault in ipairs(config) do
    --     table.insert(vaults, vault.name)
    -- end
    vim.ui.select(config, {
        prompt = "Select vault to open",
        format_item = function(item)
            return item.name
        end
    }, function(choice)
        if choice == nil then return end
        vim.cmd("tabnew")
        vim.cmd("tch " .. vim.fn.expand(choice.path))
        require("telescope.builtin").find_files()
    end)
end

return keys:new({
    key:new("n", "<Leader>nv", open_obsidian_vault, "Open vault", silent),
})
