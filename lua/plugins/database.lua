return {
    "tpope/vim-dadbod", -- Database engine
    ft = { "sql", "mysql", "psql" },
    cmd = { "DBUI", "DBUIToggle" },
    config = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_win_position = "right"
    end,
    dependencies = {
        "kristijanhusak/vim-dadbod-ui",         -- UI for interacting with databases
        "kristijanhusak/vim-dadbod-completion", -- Completion (needed outside of LSP?)
    },
}
