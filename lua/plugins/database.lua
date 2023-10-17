return {
    "tpope/vim-dadbod", -- Database engine
    ft = { "sql", "mysql", "psql" },
    config = function()
        -- TODO: move to DadbodUI

        -- local keymap = vim.keymap.set
        -- local silent = { noremap = false, silent = true }
        -- local nsilent = { noremap = true, silent = true }

        -- keymap("n", "<Leader>ldd", "<Cmd>DBUIToggle<CR>", nsilent)
        -- keymap("n", "<Leader>ldw", "<Plug>(DBUI_SaveQuery)", silent)
        -- keymap("n", "<Leader>lde", "<Plug>(DBUI_EditBindParameters)", silent)
        -- keymap({ "n", "x" }, "<Leader>lds", "<Plug>(DBUI_ExecuteQuery)", silent)

        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_win_position = "right"
    end,
    dependencies = {
        "kristijanhusak/vim-dadbod-ui",         -- UI for interacting with databases
        -- TODO: useless?
        "kristijanhusak/vim-dadbod-completion", -- Completion (needed outside of LSP?)
    },
}
