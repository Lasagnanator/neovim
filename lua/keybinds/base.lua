--<< REMAPS >>--


--<< Vars
local silent   = { noremap = true, silent = true }
local nosilent = { noremap = true, silent = false }
local utils    = require("core.utils")


--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "


--<< Table keys
local common = {
    unbind = {
        { mode = "", map = "<Space>", action = "<Nop>", opts = silent },
        { mode = "", map = "<Esc>",   action = "<Esc>", opts = silent }, -- NOTE: probably useless
    },
    base = {
        { mode = "", map = "<Leader>w", action = "<Cmd>w<CR>",                 opts = silent },
        { mode = "", map = "<Leader>q", action = "<Cmd>q!<CR>",                opts = silent },
        { mode = "", map = "<Leader>W", action = "<Cmd>wa<CR>",                opts = silent },
        { mode = "", map = "<Leader>Q", action = "<Cmd>qa!<CR>",               opts = silent },
        { mode = "", map = "<Leader>Z", action = "<Cmd>wa<CR><Cmd>qa<CR>",     opts = silent },
        { mode = "", map = "<Leader>r", action = "<Cmd>:redraw<CR>",           opts = silent },
        { mode = "", map = "<Leader>R", action = "<Cmd>w<CR><Cmd>e<CR>",       opts = silent },
        { mode = "", map = "<Leader>@", action = "<Cmd>set cursorcolumn!<CR>", opts = silent },
        { mode = "", map = "<Leader>#", action = "<Cmd>set wrap!<CR>",         opts = silent },
        { mode = "", map = "<Leader>$", action = "<Cmd>set hls!<CR>",          opts = silent },
        { mode = "", map = "<A-s>",     action = ":saveas ",                   opts = nosilent },
    },
    center_move = {
        { mode = { "n", "x" }, map = "<C-d>", action = "<C-d>zz", opts = silent },
        { mode = { "n", "x" }, map = "<C-u>", action = "<C-u>zz", opts = silent },
        { mode = { "n", "x" }, map = "<C-f>", action = "<C-f>zz", opts = silent },
        { mode = { "n", "x" }, map = "<C-b>", action = "<C-b>zz", opts = silent },
    },
    yankpaste = {
        { mode = { "n", "x" }, map = "<Leader>y", action = [["+y]], opts = silent },
        { mode = { "n", "x" }, map = "<Leader>p", action = [["+p]], opts = silent },
        { mode = { "n", "x" }, map = "<Leader>P", action = [["+P]], opts = silent },
        { mode = { "n", "x" }, map = "<Leader>d", action = [["+d]], opts = silent },
        { mode = { "n", "x" }, map = "<Leader>D", action = [["+D]], opts = silent },
    },
    windows = {
        { mode = "",           map = "<A-h>",     action = "<Cmd>wincmd h<CR>",           opts = silent },
        { mode = "",           map = "<A-j>",     action = "<Cmd>wincmd j<CR>",           opts = silent },
        { mode = "",           map = "<A-k>",     action = "<Cmd>wincmd k<CR>",           opts = silent },
        { mode = "",           map = "<A-l>",     action = "<Cmd>wincmd l<CR>",           opts = silent },
        { mode = "",           map = "<A-H>",     action = "<Cmd>wincmd H<CR>",           opts = silent },
        { mode = "",           map = "<A-J>",     action = "<Cmd>wincmd J<CR>",           opts = silent },
        { mode = "",           map = "<A-K>",     action = "<Cmd>wincmd K<CR>",           opts = silent },
        { mode = "",           map = "<A-L>",     action = "<Cmd>wincmd L<CR>",           opts = silent },
        { mode = "",           map = "<C-Left>",  action = "<Cmd>vertical resize -1<CR>", opts = silent },
        { mode = "",           map = "<C-Right>", action = "<Cmd>vertical resize +1<CR>", opts = silent },
        { mode = "",           map = "<C-Up>",    action = "<Cmd>resize +1<CR>",          opts = silent },
        { mode = "",           map = "<C-Down>",  action = "<Cmd>resize -1<CR>",          opts = silent },
        { mode = { "n", "x" }, map = "<Leader>x", action = "<Cmd>sp<CR>",                 opts = silent },
        { mode = { "n", "x" }, map = "<Leader>v", action = "<Cmd>vs<CR>",                 opts = silent },
    },
    tabs = {
        { mode = "", map = "<Leader>.", action = "<Cmd>tabnew<CR>",      opts = silent },
        { mode = "", map = "<Leader>,", action = "<Cmd>tabclose<CR>",    opts = silent },
        { mode = "", map = "<A-,>",     action = "<Cmd>tabprevious<CR>", opts = silent },
        { mode = "", map = "<A-.>",     action = "<Cmd>tabnext<CR>",     opts = silent },
        { mode = "", map = "<A-<>",     action = "<Cmd>-tabmove<CR>",    opts = silent },
        { mode = "", map = "<A->>",     action = "<Cmd>+tabmove<CR>",    opts = silent },
    },
    buffers = {
        { mode = "", map = "]b",        action = "<Cmd>bnext<CR>",       opts = silent },
        { mode = "", map = "[b",        action = "<Cmd>bprev<CR>",       opts = silent },
        { mode = "", map = "<Leader>b", action = "<Cmd>bd<CR>",          opts = silent },
        {
            mode = "",
            map = "<Leader>B",
            action = function()
                local buffers = vim.fn.getbufinfo()
                for _, buffer in pairs(buffers) do
                    if #buffer.windows < 1 then
                        vim.api.nvim_buf_delete(buffer.bufnr, {})
                    end
                end
            end,
            opts = silent
        },
    },
    quickfix = {
        { mode = "", map = "<Leader>co", action = "<Cmd>copen<CR>",              opts = silent },
        { mode = "", map = "<Leader>cc", action = "<Cmd>call setqflist([])<CR>", opts = silent },
        { mode = "", map = "]q",         action = "<Cmd>cnext<CR>",              opts = silent },
        { mode = "", map = "[q",         action = "<Cmd>cprev<CR>",              opts = silent },
    }
}


local normal = {
    base = {
        { mode = "n", map = "<S-k>", action = "k<S-j>", opts = silent },
    },
    windows = {
        { mode = "n", map = "<Leader>`", action = "<Cmd>wincmd o<CR>", opts = silent },
        { mode = "n", map = "<Leader>=", action = "<Cmd>wincmd =<CR>", opts = silent },
    }
}


local visual = {
    -- TODO: adapt the move commands to <Cmd> instead of :
    base = {
        { mode = "v", map = ">",     action = ">gv",             opts = silent },
        { mode = "v", map = "<",     action = "<gv",             opts = silent },
        { mode = "v", map = "p",     action = '"_dP',            opts = silent }, -- TODO: add conditional use for last line and last character
        { mode = "v", map = "<A-j>", action = ":move .+1<CR>==", opts = silent },
        { mode = "v", map = "<A-k>", action = ":move .-1<CR>==", opts = silent },
    },
    block = {
        { mode = "x", map = "<A-j>", action = ":move '>+1<CR>gv-gv", opts = silent },
        { mode = "x", map = "<A-k>", action = ":move '<-2<CR>gv-gv", opts = silent },
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
