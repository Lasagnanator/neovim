return {
    {
        "windwp/nvim-autopairs", -- Close pairs automatically
        opts = {
            enable_check_bracket_line = false,
            ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        config = true,
        event = "VeryLazy", -- check
    },
    {
        -- WARN: tastes have chaged, try to replicate Emacs for lisp development
        -- A good starting point might be nvlime or vlime
        "gpanders/nvim-parinfer", -- Manages parenthesis while editing LISP-like files
        cond = false,
        ft = { "yuck", "lisp" }
    },
}
