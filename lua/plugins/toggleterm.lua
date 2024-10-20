return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        persist_mode = false,
        float_opts = { border = "curved" }
    },
    keys = require("keybinds.plugins.toggleterm"):to_lazy()
}
