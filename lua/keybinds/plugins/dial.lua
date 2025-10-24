local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, "Increment", silent),
    key:new("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, "Decrement", silent),
    key:new("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, "Increment", silent),
    key:new("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, "Decrement", silent),
    key:new("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, "Increment", silent),
    key:new("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, "Decrement", silent),
    key:new("v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, "Increment", silent),
    key:new("v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, "Decrement", silent),
})
