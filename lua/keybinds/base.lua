local class          = require("core.classes")
local key            = class.Keybind
local key_group      = class.Keybinds_group
local silent         = { noremap = true, silent = true }

--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

--<< Unbind some keys
vim.keymap.set("", "<Space>", "<Nop>", silent)
vim.keymap.set("", "<Esc>", "<Esc>", silent)

-- Buffer

local keys = {

    -- Buffer
    key:new("", "<Leader>bd", "<Cmd>bd!<CR>", "Close current buffer", silent),
    key:new("", "<Leader>bD", function()
        local buffers = vim.fn.getbufinfo()
        for _, buffer in pairs(buffers) do
            if #buffer.windows < 1 then
                vim.api.nvim_buf_delete(buffer.bufnr, {})
            end
        end
    end, "Close all background buffers", silent),
    key:new("", "<Leader>bs", "<Cmd>w<CR>", "Save current buffer", silent),
    key:new("", "<Leader>bS", "<Cmd>wa<CR>", "Save all buffers", silent),
    key:new("", "]b", "<Cmd>bnext<CR>", "Buffer", silent),
    key:new("", "[b", "<Cmd>bprev<CR>", "Buffer", silent),

    -- Quit
    key:new("", "<Leader>qd", "<Cmd>qa!<CR>", "Quit whitout saving", silent),
    key:new("", "<Leader>qq", "<Cmd>wqa<CR>", "Quit and save", silent),

    -- Tabs
    key:new("", "<Leader><Tab>n", "<Cmd>tabnew<CR>", "New", silent),
    key:new("", "<Leader><Tab>q", "<Cmd>tabclose<CR>", "Close", silent),
    key:new("", "<Leader><Tab>,", "<Cmd>-tabmove<CR>", "Move left", silent),
    key:new("", "<Leader><Tab>.", "<Cmd>+tabmove<CR>", "Move right", silent),
    key:new("", "]<Tab>", "<Cmd>tabnext<CR>", "Tab", silent),
    key:new("", "[<Tab>", "<Cmd>tabprevious<CR>", "Tab", silent),

    -- Window
    key:new("n", "<Leader>wo", "<Cmd>wincmd o<CR>", "Close other windows", silent),
    key:new("", "<Leader>wq", "<Cmd>q!<CR>", "Close current window", silent),
    key:new("", "<Leader>wr", "<Cmd>redraw<CR>", "Redraw current buffer", silent),
    key:new("", "<Leader>wR", "<Cmd>w<CR><Cmd>e<CR>", "Reload current buffer", silent),
    key:new({ "n", "x" }, "<Leader>wv", "<Cmd>vs<CR>", "Split window vertically", silent),
    key:new({ "n", "x" }, "<Leader>wV", "<Cmd>set splitright! | vs | set splitright!<CR>",
        "Split window vertically without moving", silent),
    key:new({ "n", "x" }, "<Leader>wx", "<Cmd>sp<CR>", "Split window horizontally", silent),
    key:new({ "n", "x" }, "<Leader>wX", "<Cmd>set splitbelow! | sp | set splitbelow!<CR>",
        "Split window horizontally without moving", silent),
    -- TODO: Change bindings for the next three
    key:new("", "<Leader>w@", "<Cmd>set cursorcolumn!<CR>", "Toggle column highlight", silent),
    key:new("", "<Leader>w#", "<Cmd>set wrap!<CR>", "Toggle line wrap", silent),
    key:new("", "<Leader>w$", "<Cmd>set hls!<CR>", "Toggle search highlight", silent),
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
    -- TODO: find better combo for quickfix list
    key:new("", "<Leader>lo", "<Cmd>copen<CR>", "Open", silent),
    key:new("", "<Leader>lc", "<Cmd>call setqflist([])<CR>", "Clear", silent),
    key:new("", "]l", "<Cmd>cnext<CR>", "Next", silent),
    key:new("", "[l", "<Cmd>cprev<CR>", "Previous", silent),

    -- Buffer actions
    key:new("n", "<S-k>", "k<S-j>", "Join with line above", silent),
    -- TODO: review this keybinds
    key:new({ "n", "x" }, "<Leader>y", [["+y]], "Yank to clipboard", silent),
    key:new({ "n", "x" }, "<Leader>p", [["+p]], "Paste from clipboard", silent),
    key:new({ "n", "x" }, "<Leader>P", [["+P]], "Paste before from clipboard", silent),
    key:new({ "n", "x" }, "<Leader>d", [["+d]], "Cut to clipboard", silent),
    key:new({ "n", "x" }, "<Leader>D", [["+D]], "Cut line to clipboard", silent),
    key:new({ "n", "x" }, "<C-d>", "<C-d>zz", "Jump half page down and center the line", silent),
    key:new({ "n", "x" }, "<C-u>", "<C-u>zz", "Jump half page up and center the line", silent),
    key:new({ "n", "x" }, "<C-f>", "<C-f>zz", "Jump whole page down and center the line", silent),
    key:new({ "n", "x" }, "<C-b>", "<C-b>zz", "Jump whole page up and center the line", silent),
    key:new( "v", ">", ">gv", "Indent selection", silent),
    key:new( "v", "<", "<gv", "De-indent selection", silent),
    key:new( "v", "p", '"_dP', "Substitute selection", silent), -- TODO: add conditional use for last line and last character
    key:new( "v", "<A-j>", ":move .+1<CR>==", "Move line up", silent),
    key:new( "v", "<A-k>", ":move .-1<CR>==", "Move line down", silent),
    -- WARN: don't remember why, but this doesn't work
    -- key:new( "x", "<A-j>", ":move '>+1<CR>gv-gv", "Move block selection right",  silent),
    -- key:new( "x", "<A-k>", ":move '<-2<CR>gv-gv", "Move block selection left", silent),

    -- Terminal
    key:new("t", "<esc>", [[<C-\><C-n>]], "Normal esc behaviour in terminal", silent),

    -- Shortcuts
    key:new("n", "<Leader>os", function ()
        vim.cmd(":tabnew " .. vim.fn.stdpath("config") .. "/lua/core/langlist.lua")
    end, "Open language list", silent)
}

-- TODO: Refactor loop key name
for _, keymap in ipairs(keys) do
    keymap:set()
end
