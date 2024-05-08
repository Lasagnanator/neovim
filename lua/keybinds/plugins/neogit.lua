local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>gg", "<Cmd>Neogit<CR>", "Open Neogit", silent )
})
