local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }
local M      = {}

function M.on_attach(bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
    return keys:new({
        key:new("n", "}", require("nvim-tree.api").tree.change_root_to_node, "nvim-tree: CD", opts),
        key:new("n", "{", require("nvim-tree.api").tree.change_root_to_parent, "nvim-tree: Up", opts),
        key:new("n", "<C-s>", require("nvim-tree.api").node.open.horizontal, "nvim-tree: Up", opts),
    })
end

M.global = keys:new({
    key:new("n", "<Leader>ee", function() require("nvim-tree.api").tree.toggle({ focus = false }) end, "Open tree", silent),
    key:new("n", "<Leader>ew", require("nvim-tree.api").tree.focus, "Focus tree", silent),
})

return M
