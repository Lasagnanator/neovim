-- Don't do anything if launched from VSCode
if vim.g.vscode then
    return
end

vim.fn.mkdir(vim.fn.stdpath("config") .. "/lua/configurations", "p")

--<< Custom modules
require("core.globals")
require("core.settings")
require("keybinds.base")
require("core.autocmd")
require("core.langs")
require("core.lsp")
require("core.lazy")

--<< Set colorscheme
local ok, _ = pcall(vim.cmd.colorscheme, Colorscheme)
if not ok then
    vim.notify("Colorscheme " .. Colorscheme .. " not found!", vim.log.levels.WARN)
end

--<< WSL integration
if vim.fn.has("wsl") == 1 then
    require("win.wslclip")
end
