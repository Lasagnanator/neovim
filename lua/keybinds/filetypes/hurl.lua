local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>ma", "<Cmd>HurlRunner<CR>", "Run All requests", silent),
    key:new("n", "<Leader>mr", "<Cmd>HurlRunnerAt<CR>", "Run Api request", silent),
    key:new("n", "<Leader>me", "<Cmd>HurlRunnerToEntry<CR>", "Run Api request to entry", silent),
    key:new("n", "<Leader>mt", "<Cmd>HurlToggleMode<CR>", "Hurl Toggle Mode", silent),
    key:new("n", "<Leader>mv", "<Cmd>HurlVerbose<CR>", "Run Api in verbose mode", silent),
})
