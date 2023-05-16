--<< VIM DADBOD & CO. >>--

--<< Variables
local keymap = vim.keymap.set
local silent = { noremap = false, silent = true }
local nsilent = { noremap = true, silent = true }

--<< Remaps
keymap( "n",          "<Leader>ldd", "<Cmd>DBUIToggle<CR>",             nsilent )
keymap( "n",          "<Leader>ldw", "<Plug>(DBUI_SaveQuery)",          silent )
keymap( "n",          "<Leader>lde", "<Plug>(DBUI_EditBindParameters)", silent )
keymap( { "n", "x" }, "<Leader>lds", "<Plug>(DBUI_ExecuteQuery)",       silent )
