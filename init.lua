Langs = {
    go = false,
    nvim = false,
    rust = false
}

require("core.settings")
-- require("core.remap")
require("keybinds.base")
require("core.lazy")
require("keybinds.base-wk")
require("core.autocmd")

if vim.g.neovide then
    require("core.gui")
end
