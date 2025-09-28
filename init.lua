-- Do not do anything if launched from VSCode
if vim.g.vscode then
    return
end

vim.fn.mkdir(vim.fn.stdpath("config") .. "/lua/configurations", "p")

require("core.settings")
-- require("core.langs")
-- require("keybinds.base")
-- require("core.lazy")
-- require("core.autocmd")

-- if vim.fn.has("wsl") == 1 then
--     require("win.wslclip")
-- end

-- if vim.g.neovide then
--     require("core.gui")
-- end
