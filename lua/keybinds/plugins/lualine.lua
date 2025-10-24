local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("", "<Leader><Tab>,", function()
        vim.cmd("silent! -tabmove")
        require("lualine").refresh({ place = { "statusline" } })
    end, "Move left", silent),
    key:new("", "<Leader><Tab>.", function()
        vim.cmd("silent! +tabmove")
        require("lualine").refresh({ place = { "statusline" } })
    end, "Move right", silent),
})
