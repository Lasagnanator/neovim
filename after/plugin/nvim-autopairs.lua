local pairs_status, pairs = pcall(require, "nvim-autopairs")
if not pairs_status then
    return
end

pairs.setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
})
