local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>mb", "<Cmd>Cargo build<CR>", "Build", silent),
    key:new("n", "<Leader>mc", "<Cmd>Cargo check<CR>", "Check", silent),
    key:new("n", "<Leader>mr", "<Cmd>Cargo run<CR>", "Run", silent),
    key:new("n", "<Leader>mt", "<Cmd>Cargo test<CR>", "Test", silent),
})
