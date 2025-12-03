local M = {}

local key     = require("core.classes").Keybind
local keys    = require("core.classes").Keybinds_group
local silent  = { noremap = true, silent = true }
local actions = require("diffview.actions")

M.global = keys:new({
    key:new('n', '<Leader>gd', '<Cmd>DiffviewOpen<CR>', "Open diffview tab", silent),
    key:new('n', '<Leader>ghd', '<Cmd>DiffviewFileHistory<CR>', "Open commit history", silent),
    key:new('n', '<Leader>ghf', '<Cmd>DiffviewFileHistory %<CR>', "Open this file history", silent),
})

return M

