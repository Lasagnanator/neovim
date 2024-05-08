local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

-- TODO: add keybinds for opening in vsplit, hsplit and new tab
return keys:new({
    key:new("n", "<Leader>eo", function() require("oil").open() end, "", silent)
})
