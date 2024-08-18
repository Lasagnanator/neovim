local key      = require("core.classes").Keybind
local keys     = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>osc", function() require("remote-sshfs.api").connect() end, "Connect", silent),
    key:new("n", "<Leader>osd", function() require("remote-sshfs.api").disconnect() end, "Disconnect", silent),
    key:new("n", "<Leader>osf", function() require("remote-sshfs.api").find_files({}) end, "Find files", silent),
    key:new("n", "<Leader>osw", function() require("remote-sshfs.api").live_grep({}) end, "Live grep", silent)
})
