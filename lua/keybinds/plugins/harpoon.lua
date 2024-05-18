local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

local function term_move(cmd, term)
    vim.cmd(cmd)
    require("harpoon.term").gotoTerminal(term)
end

-- TODO: add keybinds for opening in vsplit, hsplit and new tab
return keys:new({
    -- Files
    key:new("n", "<Leader>ha", require("harpoon.mark").add_file, "Add file to harpoon", silent),
    key:new("n", "<Leader>hf", require("harpoon.ui").toggle_quick_menu, "Open harpoon file list", silent),
    key:new("n", "<Leader>h1", function() require("harpoon.ui").nav_file(1) end, "Open 1st file", silent),
    key:new("n", "<Leader>h2", function() require("harpoon.ui").nav_file(2) end, "Open 2nd file", silent),
    key:new("n", "<Leader>h3", function() require("harpoon.ui").nav_file(3) end, "Open 3rd file", silent),
    key:new("n", "<Leader>h4", function() require("harpoon.ui").nav_file(4) end, "Open 4th file", silent),
    key:new("n", "<Leader>h5", function() require("harpoon.ui").nav_file(5) end, "Open 5th file", silent),
    -- Terminals
    key:new("n", "<Leader>tf", function() require("harpoon.cmd-ui").toggle_quick_menu() end, "Open quick command list", silent),
    key:new("n", "<Leader>t1", function() require("harpoon.term").gotoTerminal(1) end, "Open 1st terminal", silent),
    key:new("n", "<Leader>t2", function() require("harpoon.term").gotoTerminal(2) end, "Open 2nd terminal", silent),
    key:new("n", "<Leader>t3", function() require("harpoon.term").gotoTerminal(3) end, "Open 3rd terminal", silent),
    key:new("n", "<Leader>t4", function() require("harpoon.term").gotoTerminal(4) end, "Open 4th terminal", silent),
    key:new("n", "<Leader>t5", function() require("harpoon.term").gotoTerminal(5) end, "Open 5th terminal", silent),
    -- Horizontal split
    key:new("n", "<Leader>tx1", function() term_move("split", 1) end, "Open 1st terminal", silent),
    key:new("n", "<Leader>tx2", function() term_move("split", 2) end, "Open 2nd terminal", silent),
    key:new("n", "<Leader>tx3", function() term_move("split", 3) end, "Open 3rd terminal", silent),
    key:new("n", "<Leader>tx4", function() term_move("split", 4) end, "Open 4th terminal", silent),
    key:new("n", "<Leader>tx5", function() term_move("split", 5) end, "Open 5th terminal", silent),
    -- Vertical split
    key:new("n", "<Leader>tv1", function() term_move("vsplit", 1) end, "Open 1st terminal", silent),
    key:new("n", "<Leader>tv2", function() term_move("vsplit", 2) end, "Open 2nd terminal", silent),
    key:new("n", "<Leader>tv3", function() term_move("vsplit", 3) end, "Open 3rd terminal", silent),
    key:new("n", "<Leader>tv4", function() term_move("vsplit", 4) end, "Open 4th terminal", silent),
    key:new("n", "<Leader>tv5", function() term_move("vsplit", 5) end, "Open 5th terminal", silent),
    -- New tab
    key:new("n", "<Leader>tt1", function() term_move("tabnew", 1) end, "Open 1st terminal", silent),
    key:new("n", "<Leader>tt2", function() term_move("tabnew", 2) end, "Open 2nd terminal", silent),
    key:new("n", "<Leader>tt3", function() term_move("tabnew", 3) end, "Open 3rd terminal", silent),
    key:new("n", "<Leader>tt4", function() term_move("tabnew", 4) end, "Open 4th terminal", silent),
    key:new("n", "<Leader>tt5", function() term_move("tabnew", 5) end, "Open 5th terminal", silent),
})
