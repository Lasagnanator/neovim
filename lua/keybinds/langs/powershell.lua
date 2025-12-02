local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new(
        "",
        "<Leader>mt",
        function() require("powershell").toggle_term({}) end,
        "Toggle Powershell terminal",
        silent
    ),
    key:new({ "n", "x" }, "<Leader>me", function() require("powershell").eval() end, "Eval expression", silent),
})
