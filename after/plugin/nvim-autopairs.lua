local pairs_status, pairs = pcall(require, "nvim-autopairs")
if not pairs_status then
    return
end

pairs.setup({
    check_ts = true,
    enable_check_bracket_line = false
})
