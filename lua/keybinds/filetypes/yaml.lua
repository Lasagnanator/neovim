local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("", "<Leader>mc", "<Cmd>YamlCurrentSchema<CR>", "Current schema", silent),
    key:new("", "<Leader>ms", "<Cmd>Telescope yaml_schema<CR>", "Select schema", silent),
})
