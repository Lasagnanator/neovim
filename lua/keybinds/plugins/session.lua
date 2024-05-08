local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>sn", ":SessionManager save_current_session<CR>", "", silent),
    key:new("n", "<Leader>sl", ":SessionManager load_last_session<CR>", "", silent),
    key:new("n", "<Leader>sd", ":SessionManager load_current_dir_session<CR>", "", silent),
    key:new("n", "<Leader>ss", ":SessionManager load_session<CR>", "", silent),
    key:new("n", "<Leader>sr", ":SessionManager delete_session<CR>", "", silent),
})
