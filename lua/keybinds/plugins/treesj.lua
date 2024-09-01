local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    -- TODO: change with <leader>l for all text manipulation
    key:new("n", "<C-j>", function() require("treesj").toggle() end, "Open dashboard", silent)
})
