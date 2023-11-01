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
            { mode = 'n', map = '<Leader>gd',  action = '<Cmd>DiffviewOpen<CR>',          opts = silent },
            { mode = 'n', map = '<Leader>ghd', action = '<Cmd>DiffviewFileHistory<CR>',   opts = silent },
            { mode = 'n', map = '<Leader>ghf', action = '<Cmd>DiffviewFileHistory %<CR>', opts = silent },
        }
    }
    return keybinds
end


M.treesitter = function()
    local keybinds = {
        incremental_selection = {
            init_selection = 'gv',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<BS>',
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
                map = "<Leader>lf",
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


M.dap = function()
    local keybinds = {
        dap = {
            { mode = { "n", "x" }, map = "<Leader>db", action = "<Cmd>DapToggleBreakpoint<CR>",          opts = silent },
            { mode = { "n", "x" }, map = "<Leader>dc", action = "<Cmd>DapContinue<CR>",                  opts = silent },
            { mode = { "n", "x" }, map = "<Leader>di", action = "<Cmd>DapStepInto<CR>",                  opts = silent },
            { mode = { "n", "x" }, map = "<Leader>du", action = "<Cmd>DapStepOut<CR>",                   opts = silent },
            { mode = { "n", "x" }, map = "<Leader>do", action = "<Cmd>DapStepOver<CR>",                  opts = silent },
            { mode = { "n", "x" }, map = "<Leader>dq", action = "<Cmd>DapTerminate<CR>",                 opts = silent },
            { mode = { "n", "x" }, map = "<Leader>dr", action = function() require("dap").restart() end, opts = silent },
        },
        ui = {
            { mode = { "n", "x" }, map = "<Leader>dt", action = function() require("dapui").toggle() end, opts = silent },
        }
    }
    return keybinds
end


M.oil = function()
    local keybinds = {
        { mode = "n", map = "<Leader>eo", action = "<Cmd>Oil --float<CR>", opts = silent },
    }
    return keybinds
end


M.harpoon = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local term = require("harpoon.term")
    local cmd = require("harpoon.cmd-ui")
    local keybinds = {
        { mode = "n", map = "<Leader>ha", action = mark.add_file,                          opts = silent },
        { mode = "n", map = "<Leader>hf", action = ui.toggle_quick_menu,                   opts = silent },
        { mode = "n", map = "<Leader>h1", action = function() ui.nav_file(1) end,          opts = silent },
        { mode = "n", map = "<Leader>h2", action = function() ui.nav_file(2) end,          opts = silent },
        { mode = "n", map = "<Leader>h3", action = function() ui.nav_file(3) end,          opts = silent },
        { mode = "n", map = "<Leader>h4", action = function() ui.nav_file(4) end,          opts = silent },
        { mode = "n", map = "<Leader>h5", action = function() ui.nav_file(5) end,          opts = silent },
        { mode = "n", map = "<Leader>tf", action = function() cmd.toggle_quick_menu() end, opts = silent },
        { mode = "n", map = "<Leader>t1", action = function() term.gotoTerminal(1) end,    opts = silent },
        { mode = "n", map = "<Leader>t2", action = function() term.gotoTerminal(2) end,    opts = silent },
        { mode = "n", map = "<Leader>t3", action = function() term.gotoTerminal(3) end,    opts = silent },
        { mode = "n", map = "<Leader>t4", action = function() term.gotoTerminal(4) end,    opts = silent },
        { mode = "n", map = "<Leader>t5", action = function() term.gotoTerminal(5) end,    opts = silent },
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


M.navbuddy = function()
    local keybinds = {
        { mode = "n", map = "<Leader>en", action = "<Cmd>Navbuddy<CR>", opts = silent },
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

-- TODO: Clean keybinds
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
    local keybinds = {
        { mode = "n", map = "<Leader>sl", action = ":SessionManager load_last_session<CR>",        opts = silent },
        { mode = "n", map = "<Leader>sd", action = ":SessionManager load_current_dir_session<CR>", opts = silent },
        { mode = "n", map = "<Leader>ss", action = ":SessionManager load_session<CR>",             opts = silent },
        { mode = "n", map = "<Leader>sr", action = ":SessionManager delete_session<CR>",           opts = silent },
    }
    return keybinds
end


-- NOTE: right now unusued
M.comment = function()
    local keybinds = {
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
    return keybinds
end


M.neogit = function()
    local keybinds = {
        { mode = "n", map = "<Leader>gg", action = "<Cmd>Neogit<CR>", opts = silent }
    }
    return keybinds
end


M.neorg = function()
    local keybinds = {
        {
            mode = "n",
            map = "<Leader>ni",
            action = "<Cmd>Neorg index<CR>",
            opts = silent
        },
        {
            mode = "n",
            map = "<Leader>nq",
            action = "<Cmd>Neorg return<CR>",
            opts = silent
        },
        {
            mode = "n",
            map = "<Leader>nj",
            action = "<Cmd>Neorg journal<CR>",
            opts = silent
        },
        {
            mode = "n",
            map = "<Leader>nt",
            action = "<Cmd>Neorg toc<CR>",
            opts = silent
        },
        {
            mode = "n",
            map = "<Leader>nc",
            action = "<Cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>",
            opts = silent
        },
    }
    return keybinds
end


M.trouble = function()
    local keybinds = {
        { mode = "n", map = "<Leader>lt", action = "<Cmd>Trouble<CR>", opts = silent },
    }
    return keybinds
end


M.todo = function()
    local keybinds = {
        { mode = "n", map = "<Leader>ut", action = "<Cmd>TodoTrouble<CR>",   opts = silent },
        { mode = "n", map = "<Leader>uf", action = "<Cmd>TodoTelescope<CR>", opts = silent },
        { mode = "n", map = "<Leader>uq", action = "<Cmd>TodoQuickFix<CR>",  opts = silent },
    }
    return keybinds
end


M.ufo = function()
    local keybinds = {
        { mode = "n", map = "zR", action = function() require('ufo').openAllFolds() end,  opts = silent },
        { mode = "n", map = "zM", action = function() require('ufo').closeAllFolds() end, opts = silent },
        -- TODO: evaluate utility, if useful change background colors
        {
            mode = "n",
            map = "zK",
            action = function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end,
            opts = silent
        },
    }
    return keybinds
end


return M
