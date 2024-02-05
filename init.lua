Langs = {
    ansible = true,
    clang = true,
    docker = true,
    elixir = true,
    go = true,
    json = true,
    java = true,
    javascript = true,
    lua = true,
    markdown = true,
    nvim = true,
    php = true,
    python = true,
    rust = true,
    shell = true,
    sql = true,
    tex = true,
    typescript = true,
    vue = true,
    web = true,
    yaml = true,
    zig = true
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
