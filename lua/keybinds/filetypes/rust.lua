local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("", "<Leader>mb", "<Cmd>Rustc<CR>", "Build", silent),
    key:new("", "<Leader>mt", "<Cmd>RustTest<CR>", "Test", silent),
    key:new("", "<Leader>mr", "<Cmd>RustRun<CR>", "Run", silent),
})
