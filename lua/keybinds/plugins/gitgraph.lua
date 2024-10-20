local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>gp", function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end, "Graph", silent)
})
