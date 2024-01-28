require("core.settings")
-- require("core.remap")
require("keybinds.base")
require("core.lazy")
require("core.autocmd")

if vim.g.neovide then
    require("core.gui")
end
