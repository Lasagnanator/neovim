local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("", "<Leader>mb", "<Cmd>GoBuild<CR>", "Build", silent),
    key:new("", "<Leader>mt", "<Cmd>GoModTidy<CR>", "Tidy", silent),
    key:new("", "<Leader>mr", "<Cmd>GoRun<CR>", "Run", silent),
})
