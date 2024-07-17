local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>", "Toggle line blame", silent),
    key:new("n", "<Leader>gr", "<CMD>Gitsigns reset_hunk<CR>",                 "Reset hunk", silent),
    key:new("n", "<Leader>gs", "<CMD>Gitsigns select_hunk<CR>",                "Select hunk", silent),
    key:new("n", "<Leader>gi", "<CMD>Gitsigns toggle_signs<CR>",               "Toggle Git signs", silent),
    key:new("n", "<Leader>gn", "<CMD>Gitsigns toggle_numhl<CR>",               "Toggle number highlight", silent),
    key:new("n", "<Leader>gl", "<CMD>Gitsigns toggle_linehl<CR>",              "Toggle linehighlight", silent),
    key:new("n", "<Leader>ge", "<CMD>Gitsigns toggle_deleted<CR>",                    "Toggle deleted", silent),
    key:new("n", "]c",         "<CMD>Gitsigns next_hunk<CR>",                  "Hunk", silent),
    key:new("n", "[c",         "<CMD>Gitsigns prev_hunk<CR>",                  "Hunk", silent),
})
