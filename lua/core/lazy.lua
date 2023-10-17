--<< LAZY & PLUGINS >>--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--<< Protected call on Lazy
local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

--<< Variables
Colorscheme = "tokyonight"
Priority = {
    legendary = 1500,
    colorscheme = 1000,
    treesitter = 900,
    lsp = 800,
    completion = 700,
}
Keybinds = require("keybinds.plugins")
Utils = require("core.utils")

--<< Keybind
vim.keymap.set( "", "<Leader>ll", "<Cmd>Lazy<CR>", { noremap = true, silent = true } )

--<< Setup
lazy.setup("plugins", {
   install = {
       colorscheme = { Colorscheme },
   },
   checker = {
       enabled = true,
       notify = false,
   },
   change_detection = {
       notify = false,
   },
})