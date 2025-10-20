local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }
local M = {}


M.debug = keys:new({
    key:new({ "n", "x" }, "<Leader>ds", function() require("dap").toggle_breakpoint() end, "Toggle breakpoint", silent),
    key:new({ "n", "x" }, "<Leader>dc", function() require("dap").continue() end, "Continue", silent),
    key:new({ "n", "x" }, "<Leader>di", function() require("dap").step_into() end, "Step into function", silent),
    key:new({ "n", "x" }, "<Leader>du", function() require("dap").step_out() end, "Step outside function", silent),
    key:new({ "n", "x" }, "<Leader>do", function() require("dap").step_over() end, "Step over function", silent),
    key:new({ "n", "x" }, "<Leader>dq", function() require("dap").terminate() end, "Stop", silent),
    key:new({ "n", "x" }, "<Leader>dr", function() require("dap").restart() end, "Restart", silent),
})
M.ui = keys:new({
    key:new({ "n", "x" }, "<Leader>dt", function() require("dapui").toggle() end, "Toggle UI", silent),
})

return M
