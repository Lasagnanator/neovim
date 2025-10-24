local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }
local M = {}

local function oil_wincmd(cmd)
    vim.cmd(cmd)
    require("oil").open()
end

M.global = keys:new({
    key:new("n", "<Leader>eb", function() require("oil").open() end, "Open explorer", silent),
    key:new("n", "<Leader>eo", function() require("oil").open_float() end, "Open explorer in floating window", silent),
    key:new("n", "<Leader>es", function() oil_wincmd("split") end, "Open explorer in horizontal split", silent),
    key:new("n", "<Leader>ev", function() oil_wincmd("vsplit") end, "Open explorer in vertical split", silent),
    key:new("n", "<Leader>et", function() oil_wincmd("tabnew") end, "Open explorer in new tab", silent),
})

M.navigation = {
    ["<Tab>"] = "actions.select",
    ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    ["<C-h>"] = false,
}

return M
