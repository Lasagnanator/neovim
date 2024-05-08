local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "gr", function()
        vim.ui.input({ prompt = "Tab name" }, function(input)
            if input ~= nil then
                vim.cmd("LualineRenameTab " .. input)
            end
        end)
    end, "Rename tab", silent)
})
