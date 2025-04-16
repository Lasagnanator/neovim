local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("", "<Leader>mf", "<Cmd>ElixirFromPipe<CR>", "From pipe", silent),
    key:new("", "<Leader>mt", "<Cmd>ElixirToPipe<CR>", "To pipe", silent),
    key:new("", "<Leader>me", "<Cmd>ElixirExpandMacro<CR>", "Expand macro", silent),
})
