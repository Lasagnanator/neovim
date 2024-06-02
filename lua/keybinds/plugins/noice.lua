local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>ud", "<Cmd>NoiceDismiss<CR>", "Dismiss notifications", silent),
    key:new("n", "<Leader>ua", "<Cmd>NoiceAll<CR>", "Show all messages", silent),
    key:new("n", "<Leader>ue", "<Cmd>NoiceErrors<CR>", "Show error messages", silent),
    key:new("n", "<Leader>fu", "<Cmd>NoiceTelescope<CR>", "Notification", silent),
})
