local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>fd", function() require("fzf-lua").diagnostics_document() end, "Files", silent),
    key:new("n", "<Leader>fD", function() require("fzf-lua").diagnostics_workspace() end, "Files", silent),
    key:new("n", "<Leader>ff", function() require("fzf-lua").files() end, "Files", silent),
    key:new("n", "<Leader>fk", function() require("fzf-lua").buffers() end, "Buffers", silent),
    key:new("n", "<Leader>fw", function() require("fzf-lua").live_grep() end, "Live grep", silent),
    key:new("n", "<Leader>fz", function() require("fzf-lua").builtin() end, "Pickers", silent),
    key:new("n", "<Leader>f?", function() require("fzf-lua").helptags() end, "Buffers", silent),
    key:new("n", "<Leader><Tab><Tab>", function() require("fzf-lua").tabs() end, "Buffers", silent),
})
