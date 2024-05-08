local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>ff", require("telescope.builtin").find_files, "Files", silent),
    -- key:new("n", "<Leader>fw", require("telescope.builtin").live_grep, "Live grep", silent),
    key:new("n", "<Leader>fw", require("telescope").extensions.live_grep_args.live_grep_args, "Live grep", silent),
    key:new("n", "<Leader>fb", require("telescope.builtin").buffers, "Buffers", silent),
    key:new("n", "<Leader>fh", require("telescope.builtin").help_tags, "Help", silent),
    key:new("n", "<Leader>fe", require("telescope").extensions.file_browser.file_browser, "Explorer", silent),
    key:new("n", "<Leader>cs", function() require("telescope.builtin").lsp_references({ include_current_line = true }) end, "LSP references", silent)
})
