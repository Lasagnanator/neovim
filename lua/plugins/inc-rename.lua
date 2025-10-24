---@type LazySpec
return {
    "smjonas/inc-rename.nvim",
    branch = "main",
    opts = {
        show_message = true,
        save_in_cmdline_history = false,
    },
    event = { "BufReadPre", "BufNewFile" },
}
