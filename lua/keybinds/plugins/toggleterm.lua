local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new({ "n", "x" }, "<Leader>tt", "<Cmd>99ToggleTerm direction=float name=Scratchpad<CR>", "Open scratchpad terminal", silent),
    key:new({ "n", "x" }, "<Leader>td", "<Cmd>ToggleTerm direction=float<CR>", "Open floating terminal", silent),
    key:new({ "n", "x" }, "<Leader>tx", "<Cmd>ToggleTerm direction=horizontal<CR>", "Open horizontal terminal", silent),
    key:new({ "n", "x" }, "<Leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", "Open vertical terminal", silent),
    key:new({ "n", "x" }, "<Leader>t<Tab>", "<Cmd>ToggleTerm direction=tab<CR>", "Open terminal in new tab", silent),
    key:new({ "n", "x" }, "<Leader>tf", "<Cmd>TermSelect<CR>", "Select terminal to open", silent),
    key:new("n", "<Leader>ts", "<Cmd>ToggleTermSendCurrentLine<CR>", "Send current line to terminal", silent),
    key:new("x", "<Leader>ts", "<Cmd>ToggleTermSendVisualSelection<CR>", "Send selection to terminal", silent),
})
