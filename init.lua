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
