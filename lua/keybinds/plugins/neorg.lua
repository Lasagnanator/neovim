local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent   = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>nic", "<Cmd>Neorg index<CR>", "Current", silent),
    key:new("n", "<Leader>nit", "<Cmd>tabnew<CR><Cmd>Neorg index<CR>", "Tab", silent),
    key:new("n", "<Leader>niv", "<Cmd>vs<CR><Cmd>Neorg index<CR>", "Vertical", silent),
    key:new("n", "<Leader>nix", "<Cmd>sp<CR><Cmd>Neorg index<CR>", "Horizontal", silent),
    key:new("n", "<Leader>nq", "<Cmd>Neorg return<CR>", "Close", silent),
    key:new("n", "<Leader>nj", "<Cmd>tabnew<CR><Cmd>Neorg journal<CR>", "Journal", silent),
    key:new("n", "<Leader>nt", "<Cmd>Neorg toc<CR>", "Table of contents", silent),
    key:new("n", "<Leader>ngm", "<Cmd>Neorg inject-metadata<CR>", "Inject metadata", silent),
    key:new("n", "<Leader>ngw", "<Cmd>Neorg generate-workspace-summary<CR>", "Generate workspace summary", silent),
    key:new("n", "<Leader>nc", "<Cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>", "Code", silent),
})
