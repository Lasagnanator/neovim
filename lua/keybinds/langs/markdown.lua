local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>mr", "<Cmd>Markview toggle<CR>", "Toggle rendering", silent),
    key:new("n", "<Leader>mp", function()
        if require("livepreview").is_running() then
            vim.cmd("LivePreview close")
        else
            vim.cmd("LivePreview start")
        end
    end, "Toggle browser preview", silent),
})
