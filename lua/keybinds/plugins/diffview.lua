local M = {}

local key     = require("core.classes").Keybind
local keys    = require("core.classes").Keybinds_group
local silent  = { noremap = true, silent = true }
local actions = require("diffview.actions")

M.view = keys:new({
    key:new("n", "<tab>", actions.select_next_entry, "Open the diff for the next file"),
    key:new("n", "<s-tab>", actions.select_prev_entry, "Open the diff for the previous file"),
    key:new("n", "<C-t>", actions.goto_file_tab, "Open the file in a new tabpage"),
    key:new("n", "<Leader>ew", actions.focus_files, "Bring focus to the file panel"),
    key:new("n", "<Leader>ee", actions.toggle_files, "Toggle the file panel."),
    key:new( "n", "g<C-x>", actions.cycle_layout, "Cycle through available layouts."),
    key:new("n", "[m", actions.prev_conflict, "In the merge-tool: jump to the previous conflict"),
    key:new("n", "]m", actions.next_conflict, "In the merge-tool: jump to the next conflict"),
    key:new("n", "<Leader>mo", actions.conflict_choose("ours"), "Choose the OURS version of a conflict"),
    key:new("n", "<Leader>mt", actions.conflict_choose("theirs"), "Choose the THEIRS version of a conflict"),
    key:new("n", "<Leader>mb", actions.conflict_choose("base"), "Choose the BASE version of a conflict"),
    key:new("n", "<Leader>ma", actions.conflict_choose("all"), "Choose all the versions of a conflict"),
    key:new("n", "<Leader>wq", actions.close, "Close"),
    key:new("n", "dx", actions.conflict_choose("none"), "Delete the conflict region"),
    key:new("n", "<Leader>wq", actions.close, "Close"),
    key:new("n", "<Leader>wq", actions.close, "Close"),
})

M.global = keys:new({
    key:new('n', '<Leader>gd', '<Cmd>DiffviewOpen<CR>', "Open diffview tab", silent),
    key:new('n', '<Leader>ghd', '<Cmd>DiffviewFileHistory<CR>', "Open commit history", silent),
    key:new('n', '<Leader>ghf', '<Cmd>DiffviewFileHistory %<CR>', "Open this file history", silent),
})

return M
