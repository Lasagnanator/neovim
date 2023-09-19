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

Priority = {
    colorscheme = 1000,
    lsp = 800,
    treesitter = 900
}

local plugins = "user.plugins"

local opts = {}

local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

lazy.setup(plugins, opts)
