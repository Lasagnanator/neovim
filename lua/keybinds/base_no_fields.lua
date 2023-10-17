--<< REMAPS >>--

--<< Vars
local silent         = { noremap = true, silent = true }
local nosilent       = { noremap = true, silent = false }
local utils          = require("core.utils")

--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
-- vim.keymap.set("", "<Space>", "<Nop>", silent)
-- vim.keymap.set("", "<Esc>", "<Esc>", silent)

--<< Table keys
local common = {
    unbind = {
        { "", "<Space>", "<Nop>", silent },
        { "", "<Esc>",   "<Esc>", silent }, -- NOTE: probably useless
    },
    base = {
        { "", "<Leader>w", "<Cmd>w<CR>",                 silent },
        { "", "<Leader>q", "<Cmd>q!<CR>",                silent },
        { "", "<Leader>W", "<Cmd>wa<CR>",                silent },
        { "", "<Leader>Q", "<Cmd>qa!<CR>",               silent },
        { "", "<Leader>Z", "<Cmd>wa<CR><Cmd>qa<CR>",     silent },
        { "", "<Leader>r", "<Cmd>:redraw<CR>",           silent },
        { "", "<Leader>R", "<Cmd>w<CR><Cmd>e<CR>",       silent },
        { "", "<Leader>@", "<Cmd>set cursorcolumn!<CR>", silent },
        { "", "<Leader>#", "<Cmd>set wrap!<CR>",         silent },
        { "", "<Leader>$", "<Cmd>set hls!<CR>",          silent },
        { "", "<A-s>",     ":saveas ",                   nosilent },
    },
    center_move = {
        { { "n", "x" }, "<C-d>", "<C-d>zz", silent },
        { { "n", "x" }, "<C-u>", "<C-u>zz", silent },
        { { "n", "x" }, "<C-f>", "<C-f>zz", silent },
        { { "n", "x" }, "<C-b>", "<C-b>zz", silent },
    },
    yankpaste = {
        { { "n", "x" }, "<Leader>y", [["+y]], silent },
        { { "n", "x" }, "<Leader>p", [["+p]], silent },
        { { "n", "x" }, "<Leader>P", [["+P]], silent },
        { { "n", "x" }, "<Leader>d", [["+d]], silent },
        { { "n", "x" }, "<Leader>D", [["+D]], silent },
    },
    windows = {
        { "", "<A-h>",     "<Cmd>wincmd h<CR>",           silent },
        { "", "<A-j>",     "<Cmd>wincmd j<CR>",           silent },
        { "", "<A-k>",     "<Cmd>wincmd k<CR>",           silent },
        { "", "<A-l>",     "<Cmd>wincmd l<CR>",           silent },
        { "", "<A-H>",     "<Cmd>wincmd H<CR>",           silent },
        { "", "<A-J>",     "<Cmd>wincmd J<CR>",           silent },
        { "", "<A-K>",     "<Cmd>wincmd K<CR>",           silent },
        { "", "<A-L>",     "<Cmd>wincmd L<CR>",           silent },
        { "", "<C-Left>",  "<Cmd>vertical resize -1<CR>", silent },
        { "", "<C-Right>", "<Cmd>vertical resize +1<CR>", silent },
        { "", "<C-Up>",    "<Cmd>resize +1<CR>",          silent },
        { "", "<C-Down>",  "<Cmd>resize -1<CR>",          silent },
    },
    tabs = {
        { "", "<Leader>.", "<Cmd>tabnew<CR>",      silent },
        { "", "<Leader>,", "<Cmd>tabclose<CR>",    silent },
        { "", "<A-,>",     "<Cmd>tabprevious<CR>", silent },
        { "", "<A-.>",     "<Cmd>tabnext<CR>",     silent },
        { "", "<A-<>",     "<Cmd>-tabmove<CR>",    silent },
        { "", "<A->>",     "<Cmd>+tabmove<CR>",    silent },
    },
}

local normal = {
    base = {
        { "n", "<S-k>", "k<S-j>", silent },
    },
    windows = {
        { "n", "<Leader>`", "<Cmd>wincmd o<CR>", silent },
        { "n", "<Leader>=", "<Cmd>wincmd =<CR>", silent },
    },
    plugins = {
        { "n", "<Leader>lm", "<Cmd>Mason<CR>", nosilent }, -- TODO: move to plugins/lsp/mason.lua
    }
}

local visual = {
    -- TODO: adapt the move commands to <Cmd> instead of :
    base = {
        { "v", ">",     ">gv",             silent },
        { "v", "<",     "<gv",             silent },
        { "v", "p",     '"_dp',            silent },
        { "v", "<A-j>", ":move .+1<CR>==", silent },
        { "v", "<A-k>", ":move .-1<CR>==", silent },
    },
    block = {
        { "x", "<A-j>", ":move '>+1<CR>gv-gv", silent },
        { "x", "<A-k>", ":move '<-2<CR>gv-gv", silent },
    }
}

utils.set_keybinds(common)
utils.set_keybinds(normal)
utils.set_keybinds(visual)

--<< ALTERNATIVES >>--

-- keymap( "n", "<Leader>v",     "<C-W>v<C-W>l<Cmd>e ", options )
-- keymap( "n", "<Leader>s",     "<C-W>s<C-W>j<Cmd>e ", options )
-- keymap( "x", "<A-h>", "<Cmd>move '>+1<CR>gv-gv", options )       -- Need to move text laterally
-- keymap( "x", "<A-l>", "<Cmd>move '<-2<CR>gv-gv", options )       -- Need to move text laterally
