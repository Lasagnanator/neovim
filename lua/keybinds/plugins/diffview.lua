local key     = require("core.classes").Keybind
local keys    = require("core.classes").Keybinds_group
local silent  = { noremap = true, silent = true }
local actions = require("diffview.actions")

return keys:new({
    key:new("n", "<tab>", actions.select_next_entry, "Open the diff for the next file", silent),
    key:new("n", "<s-tab>", actions.select_prev_entry, "Open the diff for the previous file", silent),
    key:new("n", "<C-t>", actions.goto_file_tab, "Open the file in a new tabpage", silent),
    key:new("n", "<Leader>ew", actions.focus_files, "Bring focus to the file panel"),
    key:new("n", "<Leader>ee", actions.toggle_files, "Toggle the file panel.", silent),
    -- {
    --     mode = "n",
    --     map = "g<C-x>",
    --     action = actions.cycle_layout,
    --     opts = { desc = "Cycle through available layouts." }
    -- },
    key:new("n", "[m", actions.prev_conflict, "In the merge-tool: jump to the previous conflict", silent),
    key:new("n", "]m", actions.next_conflict, "In the merge-tool: jump to the next conflict", silent),
    key:new("n", "<Leader>co", actions.conflict_choose("ours"), "Choose the OURS version of a conflict", silent),
    key:new("n", "<Leader>ct", actions.conflict_choose("theirs"), "Choose the THEIRS version of a conflict", silent),
    key:new("n", "<Leader>cb", actions.conflict_choose("base"), "Choose the BASE version of a conflict", silent),
    key:new("n", "<Leader>ca", actions.conflict_choose("all"), "Choose all the versions of a conflict", silent),
    key:new("n", "<Leader>q", actions.close, "Close", silent),
    key:new("n", "dx", actions.conflict_choose("none"), "Delete the conflict region", silent),
    key:new("n", "<Leader>q", actions.close, "Close", silent),
    key:new("n", "<Leader>q", actions.close, "Close", silent),
    key:new('n', '<Leader>gd', '<Cmd>DiffviewOpen<CR>', "Open diffview tab", silent),
    key:new('n', '<Leader>ghd', '<Cmd>DiffviewFileHistory<CR>', "Open commit history", silent),
    key:new('n', '<Leader>ghf', '<Cmd>DiffviewFileHistory %<CR>', "Open this file history", silent),
})
