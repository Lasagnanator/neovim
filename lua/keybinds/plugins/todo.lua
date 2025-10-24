local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }
local signs = {
    FIX = "FIX,FIXME,BUG,FIXIT,ISSUE",
    TODO = "TODO",
    HACK = "HACK",
    WARN = "WARN, WARNING, XXX",
    PERF = "PERF,PERFORMANCE,OPTIM,OPTIMIZE",
    NOTE = "NOTE,INFO",
    TEST = "TEST,TESTING,PASSED,FAILED",
}

return keys:new({
    key:new("n", "<Leader>fe", "<Cmd>TodoFzfLua<CR>", "To-do", silent),
    key:new("n", "<Leader>xe", function()
        vim.ui.select({ "FIX", "TODO", "HACK", "WARN", "PERF", "NOTE", "TEST", "ALL" }, {}, function(input)
            if input == "ALL" then
                vim.cmd("TodoQuickFix")
            elseif input ~= nil then
                vim.cmd("TodoQuickFix keywords=" .. signs[input])
            end
        end)
    end, "To-do", silent),
})
