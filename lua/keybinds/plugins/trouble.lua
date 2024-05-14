local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>uu", "<Cmd>TroubleToggle<CR>",                       "Toggle", silent),
    key:new("n", "<Leader>ue", "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Diagnostics", silent),
    key:new("n", "<Leader>ul", "<Cmd>TroubleToggle quickfix<CR>",              "Quickfix", silent),
    key:new("n", "<Leader>us", "<Cmd>TroubleToggle lsp_references<CR>",        "References", silent),
})
