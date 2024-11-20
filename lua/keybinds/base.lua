local class          = require("core.classes")
local key            = class.Keybind
local keys           = class.Keybinds_group
local silent         = { noremap = true, silent = true }

--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

--<< Unbind some keys
vim.keymap.set("", "<Space>", "<Nop>", silent)
vim.keymap.set("", "<Esc>", "<Esc>", silent)

local base = keys:new({

    -- Buffer
    key:new("", "<Leader>kd", "<Cmd>bp|bd! #<CR>", "Close current buffer", silent),
    key:new("", "<Leader>kD", function()
        local buffers = vim.fn.getbufinfo()
        for _, buffer in pairs(buffers) do
            if #buffer.windows < 1 then
                vim.api.nvim_buf_delete(buffer.bufnr, {})
            end
        end
    end, "Close all background buffers", silent),
    key:new("", "<Leader>ks", "<Cmd>w<CR>", "Save current buffer", silent),
    key:new("", "<Leader>kS", "<Cmd>wa<CR>", "Save all buffers", silent),
    key:new("", "<Leader>kw", "<Cmd>bd!<CR>", "Close current buffer and window", silent),
    key:new("", "]k", "<Cmd>bnext<CR>", "Buffer", silent),
    key:new("", "[k", "<Cmd>bprev<CR>", "Buffer", silent),

    -- Quit
    key:new("", "<Leader>qd", "<Cmd>qa!<CR>", "Quit whitout saving", silent),
    key:new("", "<Leader>qq", "<Cmd>wa<CR><Cmd>qa<CR>", "Quit and save", silent),

    -- Tabs
    key:new("", "<Leader><Tab>n", "<Cmd>tabnew<CR>", "New", silent),
    key:new("", "<Leader><Tab>q", "<Cmd>tabclose<CR>", "Close", silent),
    key:new("", "<Leader><Tab>,", "<Cmd>-tabmove<CR>", "Move left", silent),
    key:new("", "<Leader><Tab>.", "<Cmd>+tabmove<CR>", "Move right", silent),
    key:new("", "]<Tab>", "<Cmd>tabnext<CR>", "Tab", silent),
    key:new("", "[<Tab>", "<Cmd>tabprevious<CR>", "Tab", silent),

    -- Window
    key:new("", "<Leader>wc", "<Cmd>set cursorcolumn!<CR>", "Toggle column highlight", silent),
    key:new("", "<Leader>wh", "<Cmd>set hls!<CR>", "Toggle search highlight", silent),
    key:new("n", "<Leader>wo", "<Cmd>wincmd o<CR>", "Close other windows", silent),
    key:new("", "<Leader>wq", "<Cmd>q!<CR>", "Close current window", silent),
    key:new("", "<Leader>wr", "<Cmd>redraw<CR>", "Redraw current buffer", silent),
    key:new("", "<Leader>wR", "<Cmd>w<CR><Cmd>e<CR>", "Reload current buffer", silent),
    key:new({ "n", "x" }, "<Leader>wv", "<Cmd>vs<CR>", "Split window vertically", silent),
    key:new({ "n", "x" }, "<Leader>wV", "<Cmd>set splitright! | vs | set splitright!<CR>",
        "Split window vertically without moving", silent),
    key:new("", "<Leader>ww", "<Cmd>set wrap!<CR>", "Toggle line wrap", silent),
    key:new({ "n", "x" }, "<Leader>wx", "<Cmd>sp<CR>", "Split window horizontally", silent),
    key:new({ "n", "x" }, "<Leader>wX", "<Cmd>set splitbelow! | sp | set splitbelow!<CR>",
        "Split window horizontally without moving", silent),
    key:new("n", "<Leader>w=", "<Cmd>wincmd =<CR>", "Divide space evenly", silent),

    -- Window movement and managment
    key:new("", "<A-h>", "<Cmd>wincmd h<CR>", "Focus left window", silent),
    key:new("", "<A-j>", "<Cmd>wincmd j<CR>", "Focus lower window", silent),
    key:new("", "<A-k>", "<Cmd>wincmd k<CR>", "Focus upper window", silent),
    key:new("", "<A-l>", "<Cmd>wincmd l<CR>", "Focus right window", silent),
    key:new("", "<A-H>", "<Cmd>wincmd H<CR>", "Move window to the left", silent),
    key:new("", "<A-J>", "<Cmd>wincmd J<CR>", "Move window to the bottom", silent),
    key:new("", "<A-K>", "<Cmd>wincmd K<CR>", "Move window to the top", silent),
    key:new("", "<A-L>", "<Cmd>wincmd L<CR>", "Move window to the right", silent),
    key:new("", "<C-Left>", "<Cmd>vertical resize -1<CR>", "Increase vertical size by one line", silent),
    key:new("", "<C-Right>", "<Cmd>vertical resize +1<CR>", "Decrease vertical size by one line", silent),
    key:new("", "<C-Up>", "<Cmd>resize +1<CR>", "Increase horizontal size by one line", silent),
    key:new("", "<C-Down>", "<Cmd>resize -1<CR>", "Decrease horizontal size by one line", silent),

    -- Quickfix
    key:new("", "<Leader>xo", "<Cmd>copen<CR>", "Open", silent),
    key:new("", "<Leader>xc", "<Cmd>call setqflist([])<CR>", "Clear", silent),
    key:new("", "]x", "<Cmd>cnext<CR>", "Quickfix", silent),
    key:new("", "[x", "<Cmd>cprev<CR>", "Quickfix", silent),

    -- Buffer actions
    key:new("n", "<S-k>", "k<S-j>", "Join with line above", silent),
    key:new("n", "<Leader>ah", "K", "Search in the manual", silent),
    key:new("n", "<Leader>aga", "<Cmd>call setreg('+', expand('%:p'))<CR>", "Absolute path", silent),
    key:new("n", "<Leader>agr", "<Cmd>call setreg('+', expand('%'))<CR>", "Relative path", silent),
    key:new("n", "<Leader>agp", "<Cmd>call setreg('+', getcwd())<CR>", "Current directory", silent),
    key:new({ "n", "x" }, "<Leader>ay", [["+y]], "Yank to clipboard", silent),
    key:new({ "n", "x" }, "<Leader>ap", [["+p]], "Paste from clipboard", silent),
    key:new({ "n", "x" }, "<Leader>aP", [["+P]], "Paste before from clipboard", silent),
    key:new({ "n", "x" }, "<Leader>ad", [["+d]], "Cut to clipboard", silent),
    key:new({ "n", "x" }, "<Leader>aD", [["+D]], "Cut line to clipboard", silent),
    key:new({ "n", "x" }, "<C-d>", "<C-d>zz", "Jump half page down and center the line", silent),
    key:new({ "n", "x" }, "<C-u>", "<C-u>zz", "Jump half page up and center the line", silent),
    key:new({ "n", "x" }, "<C-f>", "<C-f>zz", "Jump whole page down and center the line", silent),
    key:new({ "n", "x" }, "<C-b>", "<C-b>zz", "Jump whole page up and center the line", silent),
    key:new("x", ">", ">gv", "Indent selection", silent),
    key:new("x", "<", "<gv", "De-indent selection", silent),
    key:new("x", "p", 'P', "Substitute selection", silent),
    -- FIXME: not working
    key:new("x", "<A-j>", ":move .+1<CR>==", "Move line up", silent),
    key:new("x", "<A-k>", ":move .-1<CR>==", "Move line down", silent),
    -- WARN: don't remember why, but this doesn't work
    -- key:new( "x", "<A-j>", ":move '>+1<CR>gv-gv", "Move block selection right",  silent),
    -- key:new( "x", "<A-k>", ":move '<-2<CR>gv-gv", "Move block selection left", silent),

    -- Terminal
    key:new("t", "<Esc>", [[<C-\><C-n>]], "Normal esc behaviour in terminal", silent),
    key:new("t", "<A-h>", [[<C-\><C-n><C-w>h]], "Move left from terminal", silent),
    key:new("t", "<A-j>", [[<C-\><C-n><C-w>j]], "Move down from terminal", silent),
    key:new("t", "<A-k>", [[<C-\><C-n><C-w>k]], "Move up from terminal", silent),
    key:new("t", "<A-l>", [[<C-\><C-n><C-w>l]], "Move right from terminal", silent),

    -- System
    key:new("n", "<Leader>cc", "<Cmd>LspInfo<CR>", "Open info panel", silent),
    key:new("n", "<Leader>cy", "<Cmd>LspRestart<CR>", "Restart LSPs", silent),

    -- Shortcuts
    key:new("n", "<Leader>oq", function()
        vim.cmd(":tabnew " .. vim.fn.stdpath("config") .. "/lua/configurations/langs.lua")
    end, "Open language list", silent)
})

base:set()
