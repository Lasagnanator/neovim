local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>ru", "<Cmd>TroubleToggle<CR>",                       "Toggle", silent),
    key:new("n", "<Leader>re", "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Diagnostics", silent),
    key:new("n", "<Leader>rl", "<Cmd>TroubleToggle quickfix<CR>",              "Quickfix", silent),
    key:new("n", "<Leader>rs", "<Cmd>TroubleToggle lsp_references<CR>",        "References", silent),
})
