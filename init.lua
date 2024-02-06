Langs = {
    ansible = false,
    clang = false,
    docker = false,
    elixir = false,
    go = false,
    json = false,
    java = false,
    javascript = false,
    lua = false,
    markdown = false,
    nvim = false,
    php = false,
    python = false,
    rust = false,
    shell = false,
    sql = false,
    tex = false,
    typescript = false,
    vue = false,
    web = false,
    yaml = false,
    zig = false
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
