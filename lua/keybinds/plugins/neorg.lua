local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>ni", "<Cmd>Neorg index<CR>", "Index", silent),
    key:new("n", "<Leader>nq", "<Cmd>Neorg return<CR>", "Close", silent),
    key:new("n", "<Leader>nj", "<Cmd>Neorg journal<CR>", "Journal", silent),
    key:new("n", "<Leader>nt", "<Cmd>Neorg toc<CR>", "Table of contents", silent),
    key:new("n", "<Leader>ngm", "<Cmd>Neorg inject-metadata<CR>", "Inject metadata", silent),
    key:new("n", "<Leader>ngw", "<Cmd>Neorg generate-workspace-summary<CR>", "Generate workspace summary", silent),
    key:new("n", "<Leader>nc", "<Cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>", "Code", silent),
})
