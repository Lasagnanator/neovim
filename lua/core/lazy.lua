--<< LAZY & PLUGINS >>--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--<< Protected call on Lazy
local ok, lazy = pcall(require, "lazy")
if not ok then
    print("Could not load Lazy, please check what went wrong.")
    return
end

--<< Variables
Colorscheme = "tokyonight"
Priority = {
    colorscheme = 1000,
    completion = 700,
    treesitter = 900,
}
local class = require("core.classes")
Treesitter = class.Treesitter_parsers:new({
    "vim",
    "vimdoc",
    "gitcommit",
    "gitignore",
    "gitattributes",
    "git_config",
    "git_rebase",
})
Mason = class.Language_tools:new()
After = class.Delayed_execution:new()


--<< Keybind
require("keybinds.lazy"):set()

--<< Setup
lazy.setup({
    spec = {
        { import = "plugins" },
        { import = "langs" }
    },
    install = {
        colorscheme = { Colorscheme },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
})
