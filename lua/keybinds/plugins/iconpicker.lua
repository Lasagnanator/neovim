local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n",  "<Leader>fi", "<Cmd>IconPickerNormal<CR>", "Select icon to insert", silent)
})
