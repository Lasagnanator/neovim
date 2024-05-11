local key    = require("core.classes").Keybind
local keys   = require("core.classes").Keybinds_group
local silent = { noremap = true, silent = true }

return keys:new({
    key:new("n", "zR", function() require('ufo').openAllFolds() end, "Open all folds", silent),
    key:new("n", "zM", function() require('ufo').closeAllFolds() end, "Close all folds", silent),
    -- TODO: evaluate utility, if useful change background colors
    key:new("n", "zK", function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
            vim.lsp.buf.hover()
        end
    end, "Peek fold", silent),
})
