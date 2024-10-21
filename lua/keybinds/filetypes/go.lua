local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("", "<Leader>mb", "<Cmd>GoBuild<CR>", "Build", silent),
    key:new("", "<Leader>mi", "<Cmd>GoImports<CR>", "Format imports", silent),
    key:new("", "<Leader>ms", "<Cmd>GoGet<CR>", "Get missing packages", silent),
    key:new("", "<Leader>mr", "<Cmd>GoRun<CR>", "Run", silent),
    key:new("", "<Leader>mt", "<Cmd>GoModTidy<CR>", "Tidy", silent),
    key:new("", "<Leader>mg", function()
        vim.ui.input({ prompt = "Package URL" }, function(input)
            if input ~= nil and input ~= "" then
                vim.cmd("GoGet " .. input)
            end
        end)
    end, "Get", silent),
})
