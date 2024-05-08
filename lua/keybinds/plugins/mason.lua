local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local nosilent   = { noremap = true, silent = false }

return keys:new({
    key:new("n", "<Leader>lm", "<Cmd>Mason<CR>", "Open Mason", nosilent),
})
