local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new( "", "<Leader>mp", "<Cmd>MarkdownPreviewToggle<CR>",  "Toggle preview", silent ),
    key:new( "", "<Leader>mr", "<Cmd>RenderMarkdown toggle<CR>",  "Toggle rendering", silent ),
})
