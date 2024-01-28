--<< REMAPS >>--

local wk     = require("which-key")
-- local utils    = require("core.utils")

local silent = { noremap = true, silent = true }
-- local nosilent = { noremap = true, silent = false }


--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "


--<< Unbind some keys
vim.keymap.set("", "<Space>", "<Nop>", silent)
vim.keymap.set("", "<Esc>", "<Esc>", silent)

wk.register({
    ["<Leader>"] = {
        name = "Leader keys",
        b = {
            name = "Buffer",
            d = { "<Cmd>bd!<CR>", "Close current buffer" },
            D = { function()
                local buffers = vim.fn.getbufinfo()
                for _, buffer in pairs(buffers) do
                    if #buffer.windows < 1 then
                        vim.api.nvim_buf_delete(buffer.bufnr, {})
                    end
                end
            end, "Close all background buffers"
            },
            s = { "<Cmd>w<CR>", "Save current buffer" },
            S = { "<Cmd>wa<CR>", "Save all buffers" }
        },
        q = {
            name = "Quit",
            q = { "<Cmd>qa!<CR>", "Quit all windows"}
        },
        w = {
            name = "Window",
            o = { "<Cmd>wincmd o<CR>", "Close other windows", mode = "n" },
            q = { "<Cmd>q!<CR>", "Close current window" },
            r = { "<Cmd>redraw<CR>", "Redraw current buffer" },
            R = { "<Cmd>w<CR><Cmd>e<CR>", "Reload current buffer" },
            v = { "<Cmd>vs<CR>", "Split window vertically", mode = { "n", "x" } },
            x = { "<Cmd>sp<CR>", "Split window horizontally", mode = { "n", "x" } },
            -- TODO: Change bindings for the next three
            ["@"] = { "<Cmd>set cursorcolumn!<CR>", "Toggle column highlight" },
            ["#"] = { "<Cmd>set wrap!<CR>", "Toggle line wrap" },
            ["$"] = { "<Cmd>set hls!<CR>", "Toggle search highlight" },
            ["="] = { "<Cmd>wincmd =<CR>", "Divide space evenly", mode = "n" }
        }
    },
    ["]"] = {
        name = "Next",
        b = { "<Cmd>bnext<CR>", "Buffer" },
        ["<Tab>"] = { "<Cmd>tabnext<CR>", "Tab" }
    },
    ["["] = {
        name = "Previous",
        b = { "<Cmd>bprev<CR>", "Buffer" },
        ["<Tab>"] = { "<Cmd>tabprevious<CR>", "Tab" }
    }
}, silent)
