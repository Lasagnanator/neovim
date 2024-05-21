return {
    -- TODO: useless?
    "akinsho/toggleterm.nvim",     -- Neovim's terminal wrapper
    opts = {
        open_mapping = [[<c-\>]],
        shade_terminals = false,     -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    },
}
