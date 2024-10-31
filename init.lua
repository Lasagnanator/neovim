-- Demo Neovim extension inside VSCode
if vim.g.vscode then
    return
end

vim.fn.mkdir(vim.fn.stdpath("config") .. "/lua/configurations", "p")

require("core.settings")
require("core.langs")
require("keybinds.base")
require("core.lazy")
require("core.autocmd")

if require("core.utils").is_wsl() then
    require("win.wslclip")
end

if vim.g.neovide then
    require("core.gui")
end
