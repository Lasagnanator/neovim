local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>fb", require("telescope").extensions.file_browser.file_browser, "Browser", silent),
    key:new("n", "<Leader>fd", require("telescope.builtin").diagnostics, "Diagnostics", silent),
    key:new("n", "<Leader>ff", require("telescope.builtin").find_files, "Files", silent),
    key:new("n", "<Leader>fh", require("telescope.builtin").help_tags, "Help", silent),
    key:new("n", "<Leader>fk", require("telescope.builtin").buffers, "Buffers", silent),
    -- key:new("n", "<Leader>fw", require("telescope.builtin").live_grep, "Live grep", silent),
    key:new("n", "<Leader>fw", require("telescope").extensions.live_grep_args.live_grep_args, "Live grep", silent),
    key:new("n", "<Leader><Tab><Tab>", require("telescope-tabs").list_tabs, "List", silent),
})
