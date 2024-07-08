local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>gb",  "<CMD>Gitsigns toggle_current_line_blame<CR>",  "Toggle line blame", silent),
    key:new("n", "<Leader>gss", "<CMD>Gitsigns toggle_signs<CR>",               "Toggle Git signs", silent),
    key:new("n", "<Leader>gsn", "<CMD>Gitsigns toggle_numhl<CR>",               "Toggle number highlight", silent),
    key:new("n", "<Leader>gsl", "<CMD>Gitsigns toggle_linehl<CR>",              "Toggle linehighlight", silent),
    key:new("n", "]c",          function() require("gitsigns").next_hunk() end, "Hunk", silent),
    key:new("n", "[c",          function() require("gitsigns").prev_hunk() end, "Hunk", silent),
})
