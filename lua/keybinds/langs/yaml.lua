local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>mf", function() require("schema-companion").select_schema() end, "Toggle rendering", silent),
})
