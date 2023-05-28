--<< REMAPS >>--

--<< Vars
local keymap   = vim.keymap.set
local silent   = { noremap = true, silent = true }
local nosilent = { noremap = true, silent = false }

--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
keymap( "", "<Space>", "<Nop>", silent )
keymap( "", "<Esc>",   "<Esc>", silent )


--<< ALL MODES >>--

--<< Base
keymap( "",           "<Leader>w", "<Cmd>w<CR>",                  silent )
keymap( "",           "<Leader>q", "<Cmd>q!<CR>",                 silent )
keymap( "",           "<Leader>W", "<Cmd>wa<CR>",                 silent )
keymap( "",           "<Leader>Q", "<Cmd>qa!<CR>",                silent )
keymap( "",           "<Leader>Z", "<Cmd>wa<CR>\
                                    <Cmd>qa<CR>",                 silent )
keymap( "",           "<Leader>r", "<Cmd>w<CR>\
                                    <Cmd>e<CR>",                  silent )
keymap( "",           "<Leader>@", "<Cmd>set cursorcolumn!<CR>",  silent )
keymap( "",           "<A-s>",     ":saveas ",                    nosilent )

--<< Yank and paste
keymap( { "n", "x" }, "<Leader>y", [["+y]],                       silent )
keymap( { "n", "x" }, "<Leader>p", [["+p]],                       silent )
keymap( { "n", "x" }, "<Leader>P", [["+P]],                       silent )
keymap( { "n", "x" }, "<Leader>d", [["+d]],                       silent )
keymap( { "n", "x" }, "<Leader>D", [["+D]],                       silent )

--<< Move between windows
keymap( "",           "<A-h>",     "<Cmd>wincmd h<CR>",           silent )
keymap( "",           "<A-j>",     "<Cmd>wincmd j<CR>",           silent )
keymap( "",           "<A-k>",     "<Cmd>wincmd k<CR>",           silent )
keymap( "",           "<A-l>",     "<Cmd>wincmd l<CR>",           silent )

--<< Move windows                       
keymap( "",           "<A-H>",     "<Cmd>wincmd H<CR>",           silent )
keymap( "",           "<A-J>",     "<Cmd>wincmd J<CR>",           silent )
keymap( "",           "<A-K>",     "<Cmd>wincmd K<CR>",           silent )
keymap( "",           "<A-L>",     "<Cmd>wincmd L<CR>",           silent )

--<< Resize windows
keymap( "",           "<C-Left>",  "<Cmd>vertical resize -1<CR>", silent )
keymap( "",           "<C-Right>", "<Cmd>vertical resize +1<CR>", silent )
keymap( "",           "<C-Up>",    "<Cmd>resize +1<CR>",          silent )
keymap( "",           "<C-Down>",  "<Cmd>resize -1<CR>",          silent )

--<< Tabs
keymap( "",           "<Leader>.", "<Cmd>tabnew<CR>",             silent )
keymap( "",           "<Leader>,", "<Cmd>tabclose<CR>",           silent )
keymap( "",           "<A-,>",     "<Cmd>tabprevious<CR>",        silent )
keymap( "",           "<A-.>",     "<Cmd>tabnext<CR>",            silent )
keymap( "",           "<A-<>",     "<Cmd>-tabmove<CR>",           silent )
keymap( "",           "<A->>",     "<Cmd>+tabmove<CR>",           silent )


--<< NORMAL MODE >>--

--<< Base
keymap( "n", "<S-k>",         "k<S-j>",                      silent )

--<< Window management
keymap( "n", "<Leader>`",     "<Cmd>wincmd o<CR>",           silent )
keymap( "n", "<Leader><bar>", "<Cmd>wincmd <bar><CR>",       silent )
keymap( "n", "<Leader>_",     "<Cmd>wincmd _<CR>",           silent )

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
