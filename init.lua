require("core.settings")
require("keybinds.base")
require("core.langs")
require("core.lazy")
require("keybinds.base-wk")
require("core.autocmd")

if require("core.utils").is_wsl() then
    require("win.wslclip")
end

if vim.g.neovide then
    require("core.gui")
end
