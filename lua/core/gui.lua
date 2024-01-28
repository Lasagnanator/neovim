local settings = {
    guifont = "JetBrains Mono:h11"
}
for k, v in pairs(settings) do
    vim.opt[k] = v
end
