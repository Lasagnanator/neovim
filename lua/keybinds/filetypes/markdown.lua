local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

local M = {}

M.filetype = keys:new({
    key:new("n", "<Leader>mr", "<Cmd>Markview toggle<CR>", "Toggle rendering", silent),
    key:new("n", "<Leader>mp", "<Cmd>MarkdownPreviewToggle<CR>", "Toggle browser preview", silent),
})

M.tools = keys:new({
    key:new("n", "<Leader>ms", "<Plug>(markdown_toggle_emphasis)", "Toggle emphasis", silent),
    key:new("n", "<Leader>ma", "<Plug>(markdown_toggle_emphasis_line)", "Toggle line emphasis", silent),
    key:new("x", "<Leader>ms", "<Plug>(markdown_toggle_emphasis_visual)", "Toggle emphasis", silent),
    key:new("n", "<Leader>md", "<Plug>(markdown_delete_emphasis)", "Delete emphasis", silent),
    key:new("n", "<Leader>mc", "<Plug>(markdown_change_emphasis)", "Change emphasis", silent),
    key:new("n", "<Leader>ml", "<Plug>(markdown_add_link)", "Add link", silent),
    key:new("x", "<Leader>ml", "<Plug>(markdown_add_link_visual)", "Add link", silent),
    key:new("n", "<Leader>me", "<Plug>(markdown_go_current_heading)", "Go to current heading", silent),
    key:new("n", "<Leader>mw", "<Plug>(markdown_go_parent_heading)", "Go to parent heading", silent),
    key:new("n", "]e", "<Plug>(markdown_go_next_heading)", "Go to next heading", silent),
    key:new("n", "[e", "<Plug>(markdown_go_prev_heading)", "Go to previous heading", silent),
    key:new("n", "<C-Space>", "<Cmd>MDTaskToggle<CR>", "Toggle task", silent),
    key:new("n", "<C-CR>", "<Cmd>MDListItemBelow<CR>", "Open TOC", silent),
    key:new("n", "<C-S-CR>", "<Cmd>MDListItemAbove<CR>", "Open TOC", silent),
    key:new("n", "<Leader>mi", "<Cmd>MDToc<CR>", "Open TOC", silent),
    key:new("n", "<Leader>mg", "<Cmd>MDInsertToc<CR>", "Open TOC", silent),
    key:new("n", "<Leader>mn", "<Cmd>MDResetListNumbering<CR>", "Reset list", silent),
})

return M
