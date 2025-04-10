local settings = {
    guifont = (function ()
        if vim.fn.has("win32") then
            return "JetBrainsMono Nerd Font Propo:h11"
        else
            return "JetBrains Mono:h11"
        end
    end)()
}
for k, v in pairs(settings) do
    vim.opt[k] = v
end
