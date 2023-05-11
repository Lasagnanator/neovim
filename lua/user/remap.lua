--<< REMAPS >>--

--<< Vars
local nosilent = { noremap = true, silent = false }
local silent   = { noremap = true, silent = true }
local keymap   = vim.keymap.set

--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
keymap( "", "<Space>", "<Nop>", silent )
keymap( "", "<Esc>",   "<Esc>", silent )


--<< ALL MODES >>--

--<< Yank and paste
keymap( { "n", "x" }, "<Leader>y", [["+y]], silent )
keymap( { "n", "x" }, "<Leader>p", [["+p]], silent )
keymap( { "n", "x" }, "<Leader>P", [["+P]], silent )
keymap( { "n", "x" }, "<Leader>d", [["+d]], silent )
keymap( { "n", "x" }, "<Leader>D", [["+D]], silent )


--<< NORMAL MODE >>--

--<< Base
keymap( "n", "<Leader>w",     "<Cmd>w<CR>",                  silent )
keymap( "n", "<Leader>q",     "<Cmd>q!<CR>",                 silent )
keymap( "n", "<Leader>W",     "<Cmd>wa<CR>",                 silent )
keymap( "n", "<Leader>Q",     "<Cmd>qa!<CR>",                silent )
keymap( "n", "<Leader>Z",     "<Cmd>wa<CR>\
                               <Cmd>qa<CR>",                 silent )
keymap( "n", "<Leader>r",     "<Cmd>e<CR>",                  silent )
keymap( "n", "<Leader>@",     "<Cmd>set cursorcolumn!<CR>",  silent )
keymap( "n", "<C-s>",         ":saveas ",                    nosilent )
keymap( "n", "<S-k>",         "k<S-j>",                      silent )

--<< Window management
keymap( "n", "<Leader>o",     "<Cmd>wincmd o<CR>",           silent )
keymap( "n", "<Leader><bar>", "<Cmd>wincmd <bar><CR>",       silent )
keymap( "n", "<Leader>_",     "<Cmd>wincmd _<CR>",           silent )

--<< Move between windows
keymap( "n", "<A-h>",         "<Cmd>wincmd h<CR>",           silent )
keymap( "n", "<A-j>",         "<Cmd>wincmd j<CR>",           silent )
keymap( "n", "<A-k>",         "<Cmd>wincmd k<CR>",           silent )
keymap( "n", "<A-l>",         "<Cmd>wincmd l<CR>",           silent )

--<< Move windows                           
keymap( "n", "<A-H>",         "<Cmd>wincmd H<CR>",           silent )
keymap( "n", "<A-J>",         "<Cmd>wincmd J<CR>",           silent )
keymap( "n", "<A-K>",         "<Cmd>wincmd K<CR>",           silent )
keymap( "n", "<A-L>",         "<Cmd>wincmd L<CR>",           silent )

--<< Resize windows
keymap( "n", "<C-Left>",      "<Cmd>vertical resize -1<CR>", silent )
keymap( "n", "<C-Right>",     "<Cmd>vertical resize +1<CR>", silent )
keymap( "n", "<C-Up>",        "<Cmd>resize +1<CR>",          silent )
keymap( "n", "<C-Down>",      "<Cmd>resize -1<CR>",          silent )

--<< Tabs
keymap( "n", "<Leader>.",     "<Cmd>tabnew<CR>",             silent )
keymap( "n", "<Leader>,",     "<Cmd>tabclose<CR>",           silent )
keymap( "n", "<A-,>",         "<Cmd>tabprevious<CR>",        silent )
keymap( "n", "<A-.>",         "<Cmd>tabnext<CR>",            silent )
keymap( "n", "<A-<>",         "<Cmd>-tabmove<CR>",           silent )
keymap( "n", "<A->>",         "<Cmd>+tabmove<CR>",           silent )

--<< Plugin
keymap( "n", "<C-p>c",        "<Cmd>PackerCompile<CR>\
                               <Cmd>PackerInstall<CR>",      nosilent )
keymap( "n", "<C-p>u",        "<Cmd>PackerSync<CR>\
                               <Cmd>TSUpdate<CR>",           nosilent )
keymap( "n", "<Leader>lm",    "<Cmd>Mason<CR>",              nosilent )


--<< VISUAL MODE >>--
-- TODO: adapt the move commands to <Cmd> instead of :

--<< Normal
keymap( "v", ">",             ">gv",                         silent )
keymap( "v", "<",             "<gv",                         silent )
keymap( "v", "p",             '"_dP',                        silent )
keymap( "v", "<A-j>",         ":move .+1<CR>==",             silent )
keymap( "v", "<A-k>",         ":move .-1<CR>==",             silent )

--<< Block
keymap( "x", "<A-j>",         ":move '>+1<CR>gv-gv",         silent )
keymap( "x", "<A-k>",         ":move '<-2<CR>gv-gv",         silent )


--<< ALTERNATIVES >>--

-- keymap( "n", "<Leader>v",     "<C-W>v<C-W>l<Cmd>e ", options )
-- keymap( "n", "<Leader>s",     "<C-W>s<C-W>j<Cmd>e ", options )
-- keymap( "x", "<A-h>", "<Cmd>move '>+1<CR>gv-gv", options )       -- Need to move text laterally
-- keymap( "x", "<A-l>", "<Cmd>move '<-2<CR>gv-gv", options )       -- Need to move text laterally
