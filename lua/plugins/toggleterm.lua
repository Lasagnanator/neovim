return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.4
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<C-\>]],
        shade_terminals = true,
        persist_mode = false,
    },
    lazy = false,
    keys = require("keybinds.plugins.toggleterm"):to_lazy(),
}
