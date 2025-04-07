return {
    "mbbill/undotree",
    config = function ()
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_TreeNodeShape = '*'
        vim.g.undotree_TreeVertShape = '│'
        vim.g.undotree_TreeSplitShape = '╱'
        vim.g.undotree_TreeReturnShape = '╲'
    end,
    keys = require("keybinds.plugins.undotree"):to_lazy(),
}
