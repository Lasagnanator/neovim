local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "<Leader>ef", require("telescope").extensions.file_browser.file_browser, "Browser", silent),
    key:new("n", "<Leader>fd", require("telescope.builtin").diagnostics, "Diagnostics", silent),
    key:new("n", "<Leader>ff", require("telescope.builtin").find_files, "Files", silent),
    key:new("n", "<Leader>fh", function()
        require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true
        })
    end, "Files", silent),
    key:new("n", "<Leader>fH", require("telescope.builtin").help_tags, "Help", silent),
    key:new("n", "<Leader>fk", require("telescope.builtin").buffers, "Buffers", silent),
    -- key:new("n", "<Leader>fw", require("telescope.builtin").live_grep, "Live grep", silent),
    key:new("n", "<Leader>fw", require("telescope").extensions.live_grep_args.live_grep_args, "Live grep", silent),
    key:new("n", "<Leader><Tab><Tab>", require("telescope-tabs").list_tabs, "List", silent),
    key:new("n", "<Leader>fgc", require("telescope.builtin").git_commits, "Commits", silent),
    key:new("n", "<Leader>fgk", require("telescope.builtin").git_bcommits, "Buffer commits", silent),
    key:new("n", "<Leader>fgb", require("telescope.builtin").git_branches, "Branches", silent),
    key:new("n", "<Leader>fgs", require("telescope.builtin").git_status, "Status", silent),
})
