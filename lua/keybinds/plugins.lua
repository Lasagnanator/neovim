local M        = {}
local silent   = { noremap = true, silent = true }
local nosilent = { noremap = true, silent = false }


M.cmp = function()
    local cmp      = require("cmp")
    local luasnip  = require("luasnip")
    local keybinds = {
        ["<C-k>"]     = cmp.mapping.select_prev_item(),
        ["<C-j>"]     = cmp.mapping.select_next_item(),
        ["<C-b>"]     = cmp.mapping.scroll_docs(-2),
        ["<C-f>"]     = cmp.mapping.scroll_docs(2),
        ["<C-Space>"] = cmp.mapping.abort(),
        ["<CR>"]      = cmp.mapping.confirm({ select = false }), -- False requires selection, true autoselects first result
        ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }
    return keybinds
end


M.gitsigns = function()
    local keybinds = {
        common = {
            { mode = "n", map = "<Leader>gss", action = "<CMD>Gitsigns toggle_signs<CR>",  opts = silent },
            { mode = "n", map = "<Leader>gsn", action = "<CMD>Gitsigns toggle_numhl<CR>",  opts = silent },
            { mode = "n", map = "<Leader>gsl", action = "<CMD>Gitsigns toggle_linehl<CR>", opts = silent },
        }
    }
    return keybinds
end


M.diffview = function()
    local actions  = require("diffview.actions")
    local keybinds = {
        view = {
            {
                mode = "n",
                map = "<tab>",
                action = actions.select_next_entry,
                opts = {
                    desc = "Open the diff for the next file"
                }
            },
            {
                mode = "n",
                map = "<s-tab>",
                action = actions.select_prev_entry,
                opts = {
                    desc = "Open the diff for the previous file"
                }
            },
            {
                mode = "n",
                map = "<C-t>",
                action = actions.goto_file_tab,
                opts = {
                    desc = "Open the file in a new tabpage"
                }
            },
            {
                mode = "n",
                map = "<Leader>ew",
                action = actions.focus_files,
                opts = {
                    desc = "Bring focus to the file panel"
                }
            },
            {
                mode = "n",
                map = "<Leader>ee",
                action = actions.toggle_files,
                opts = {
                    desc = "Toggle the file panel."
                }
            },
            -- { mode = "n", map = "g<C-x>",     action = actions.cycle_layout, opts = { desc = "Cycle through available layouts." } },
            {
                mode = "n",
                map = "<Leader>k",
                action = actions.prev_conflict,
                opts = {
                    desc = "In the merge-tool: jump to the previous conflict"
                }
            },
            {
                mode = "n",
                map = "<Leader>j",
                action = actions.next_conflict,
                opts = {
                    desc = "In the merge-tool: jump to the next conflict"
                }
            },
            {
                mode = "n",
                map = "<Leader>co",
                action = actions.conflict_choose("ours"),
                opts = {
                    desc = "Choose the OURS version of a conflict"
                }
            },
            {
                mode = "n",
                map = "<Leader>ct",
                action = actions.conflict_choose("theirs"),
                opts = {
                    desc = "Choose the THEIRS version of a conflict"
                }
            },
            {
                mode = "n",
                map = "<Leader>cb",
                action = actions.conflict_choose("base"),
                opts = {
                    desc = "Choose the BASE version of a conflict"
                }
            },
            {
                mode = "n",
                map = "<Leader>ca",
                action = actions.conflict_choose("all"),
                opts = {
                    desc = "Choose all the versions of a conflict"
                }
            },
            {
                mode = "n",
                map = "<Leader>q",
                action = actions.close,
                opts = { desc = "Close" }
            },
            {
                mode = "n",
                map = "dx",
                action = actions.conflict_choose("none"),
                opts = {
                    desc = "Delete the conflict region"
                }
            },
        },
        file_panel = {
            {
                mode = "n",
                map = "<Leader>q",
                action = actions.close,
                opts = { desc = "Close" }
            },
        },
        file_history_panel = {
            {
                mode = "n",
                map = "<Leader>q",
                action = actions.close,
                opts = { desc = "Close" }
            },
        },
        common = {
            { mode = 'n', map = '<Leader>lf',  action = '<Cmd>DiffviewOpen<CR>',          opts = silent },
            { mode = 'n', map = '<Leader>lhd', action = '<Cmd>DiffviewFileHistory<CR>',   opts = silent },
            { mode = 'n', map = '<Leader>lhf', action = '<Cmd>DiffviewFileHistory %<CR>', opts = silent },
        }
    }
    return keybinds
end


M.lsp = function(args)
    local keybinds = {
        mason = {
            { mode = "n", map = "<Leader>lm", action = "<Cmd>Mason<CR>", opts = nosilent },
        },
        on_attach = {
            { mode = "n", map = "<Leader>le", action = vim.diagnostic.open_float, opts = args },
            { mode = "n", map = "<A-[>",      action = vim.diagnostic.goto_prev,  opts = args },
            { mode = "n", map = "<A-]>",      action = vim.diagnostic.goto_next,  opts = args },
            { mode = "n", map = "<Leader>lr", action = vim.lsp.buf.rename,        opts = args },
            {
                mode = "n",
                map = "<Leader>ld",
                action = function()
                    vim.lsp.buf.definition({
                        reuse_win = true,
                    })
                end,
                opts = args
            },
            { mode = "n", map = "<Leader>li",  action = vim.lsp.buf.hover,                   opts = args },
            { mode = "n", map = "<Leader>lc",  action = vim.lsp.buf.code_action,             opts = args },
            { mode = "n", map = "<Leader>lt",  action = "<Cmd>Trouble<CR>",                  opts = args },
            { mode = "n", map = "<Leader>lwa", action = vim.lsp.buf.add_workspace_folder,    opts = args },
            { mode = "n", map = "<Leader>lwr", action = vim.lsp.buf.remove_workspace_folder, opts = args },
            {
                mode = "n",
                map = "<Leader>lwl",
                action = function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end,
                opts = args
            },
            {
                mode = "n",
                map = "<Leader>lpp",
                action = function()
                    vim.lsp.buf.format({
                        async = true
                    })
                end,
                opts = args
            }
        }
    }
    return keybinds
end


M.telescope = function()
    local builtin = require("telescope.builtin")
    local keybinds = {
        common = {
            { mode = "n", map = "<Leader>ff", action = builtin.find_files, opts = silent },
            { mode = "n", map = "<Leader>fw", action = builtin.live_grep,  opts = silent },
            { mode = "n", map = "<Leader>fb", action = builtin.buffers,    opts = silent },
            { mode = "n", map = "<Leader>fh", action = builtin.help_tags,  opts = silent },
            -- { mode = "n", map = "<Leader>fg", action = find_git_fallback,  opts = { noremap = true, silent = true } },
            -- { mode = "n", map = "<Leader>fe", action = file_browser,       opts = { noremap = true, silent = true } },
            {
                mode = "n",
                map = "<Leader>ls",
                action = function()
                    builtin.lsp_references({
                        include_current_line = true,
                    })
                end,
                opts = silent
            }
        }
    }
    return keybinds
end


M.nvimtree = function(bufnr)
    bufnr = bufnr or 0
    local api = require("nvim-tree.api")
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    local keybinds = {
        on_attach = {
            { mode = "n", map = "}", action = api.tree.change_root_to_node,   opts = opts("CD") },
            { mode = "n", map = "{", action = api.tree.change_root_to_parent, opts = opts("Up") },
        },
        common = {
            {
                mode = "n",
                map = "<Leader>ee",
                action = function()
                    api.tree.toggle({
                        focus = false
                    })
                end,
                opts = silent
            },
            { mode = "n", map = "<Leader>ew", action = api.tree.focus, opts = silent },
        }
    }
    return keybinds
end


M.ui = function()
    local keybinds = {
        lualine = {
            {
                mode = "n",
                map = "gr",
                action = function()
                    vim.ui.input({ prompt = "Tab name" }, function(input)
                        if input ~= nil then
                            vim.cmd("LualineRenameTab " .. input)
                        end
                    end)
                end,
                opts = silent
            }
        }
    }
    return keybinds
end

-- TODO: utilities

M.terminal = function()
    local terminal = require("toggleterm.terminal").Terminal
    local floating = terminal:new({ direction = "float" })
    local toggle_floating = function()
        floating:toggle()
    end
    local keybinds = {
        { mode = "x", map = "<Leader>tl", action = "<CMD>ToggleTermSendVisualSelection<CR>", opts = silent },
        { mode = "n", map = "<Leader>tl", action = "<CMD>ToggleTermSendCurrentLine<CR>",     opts = silent },
        { mode = "n", map = "<Leader>tf", action = toggle_floating,                          opts = silent },
        { mode = "n", map = "<Leader>tn", action = "<CMD>ToggleTermSetName<CR>",             opts = silent },
        { mode = "t", map = "<esc>",      action = [[<C-\><C-n>]],                           opts = silent },
    }
    return keybinds
end

M.session = function()
    local keymaps = {
        { mode = "n", map = "<Leader>sl", action = ":SessionManager load_last_session<CR>",        opts = silent },
        { mode = "n", map = "<Leader>sd", action = ":SessionManager load_current_dir_session<CR>", opts = silent },
        { mode = "n", map = "<Leader>ss", action = ":SessionManager load_session<CR>",             opts = silent },
        { mode = "n", map = "<Leader>sr", action = ":SessionManager delete_session<CR>",           opts = silent },
    }
    return keymaps
end


-- NOTE: right now unusued
M.comment = function()
    local keymaps = {
        toggler = {        -- LHS of toggle mappings in NORMAL mode
            line = 'gcc',  -- Line-comment toggle keymap
            block = 'gbc', -- Block-comment toggle keymap
        },
        opleader = {       -- LHS of operator-pending mappings in NORMAL and VISUAL mode
            line = 'gc',   -- Line-comment keymap
            block = 'gb',  -- Block-comment keymap
        },
        extra = {          -- LHS of extra mappings
            above = 'gcO', -- Add comment on the line above
            below = 'gco', -- Add comment on the line below
            eol = 'gca',   -- Add comment at the end of line, maybe useless
        },
    }
    return keymaps
end


return M
