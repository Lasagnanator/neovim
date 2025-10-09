-- Don't do anything if launched from VSCode
if vim.g.vscode then
    return
end

vim.fn.mkdir(vim.fn.stdpath("config") .. "/lua/configurations", "p")

require("core.globals")
require("core.settings")
require("keybinds.base")
require("core.autocmd")
require("core.langs_list")
require("core.lazy")
require("core.langs")


if vim.fn.has("wsl") == 1 then
    require("win.wslclip")
end

-- if vim.g.neovide then
--     require("core.gui")
-- end
