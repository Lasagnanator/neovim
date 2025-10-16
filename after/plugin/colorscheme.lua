local ok, _ = pcall(vim.cmd.colorscheme, Colorscheme)
if not ok then
    vim.notify("Colorscheme " .. Colorscheme .. " not found!", vim.log.levels.WARN)
end

