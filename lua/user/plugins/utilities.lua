return {
    {
        -- TODO: useless?
        "akinsho/toggleterm.nvim", -- Neovim's terminal wrapper
        opts = {
            open_mapping = [[<c-\>]],
            shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
        },
        init = function()
            --<< Custom terminals
            local terminal = require("toggleterm.terminal").Terminal
            local floating = terminal:new({ direction = "float" })
            local toggle_floating = function()
                floating:toggle()
            end
            --<< Keys
            vim.keymap.set("x", "<Leader>tl", "<CMD>ToggleTermSendVisualSelection<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>tl", "<CMD>ToggleTermSendCurrentLine<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>tf", toggle_floating, { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>tn", "<CMD>ToggleTermSetName<CR>", { noremap = true, silent = true })
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
        end,
    },
    {
        "Shatur/neovim-session-manager",                                                                  -- Automatic session manager
        opts = {
            sessions_dir               = require("plenary.path"):new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
            path_replacer              = '__',                                                            -- The character to which the path separator will be replaced for session files.
            colon_replacer             = '++',                                                            -- The character to which the colon symbol will be replaced for session files.
            autoload_mode              = "Disabled",                                                      -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
            autosave_last_session      = true,                                                            -- Automatically save last session on exit and on session switch.
            autosave_ignore_not_normal = true,                                                            -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
            autosave_ignore_dirs       = {},                                                              -- A list of directories where the session will not be autosaved.
            autosave_ignore_filetypes  = {                                                                -- All buffers of these file types will be closed before the session is saved.
                'gitcommit',
            },
            autosave_ignore_buftypes   = {},    -- All buffers of these bufer types will be closed before the session is saved.
            autosave_only_in_session   = false, -- Always autosaves session. If true, only autosaves after a session is active.
            max_path_length            = 80,    -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
        },
        init = function()
            vim.keymap.set("n", "<Leader>sl", ":SessionManager load_last_session<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>sd", ":SessionManager load_current_dir_session<CR>",
                { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>ss", ":SessionManager load_session<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<Leader>sr", ":SessionManager delete_session<CR>", { noremap = true, silent = true })
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        -- TODO: evaluate (yes)
        "stevearc/dressing.nvim", -- Interface for input prompts
        config = true,
    },
    {
        "numToStr/Comment.nvim", -- Easier commenting
        opts = {
            padding = true,      -- Add a space b/w comment and the line
            sticky = true,       -- Whether the cursor should stay at its position
            ignore = nil,        -- Lines to be ignored while (un)comment
            toggler = {          -- LHS of toggle mappings in NORMAL mode
                line = 'gcc',    -- Line-comment toggle keymap
                block = 'gbc',   -- Block-comment toggle keymap
            },
            opleader = {         -- LHS of operator-pending mappings in NORMAL and VISUAL mode
                line = 'gc',     -- Line-comment keymap
                block = 'gb',    -- Block-comment keymap
            },
            extra = {            -- LHS of extra mappings
                above = 'gcO',   -- Add comment on the line above
                below = 'gco',   -- Add comment on the line below
                eol = 'gcA',     -- Add comment at the end of line
            },
            -- Enable keybindings
            -- NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
            },
            pre_hook = nil,   -- Function to call before (un)comment
            post_hook = nil,  -- Function to call after (un)comment
        }
    },
    {
        "norcalli/nvim-colorizer.lua", -- Colorful hex codes, alternative?
        opts = {
           ['*'] = {
            RGB      = true,           -- #RGB hex codes
            RRGGBB   = true,           -- #RRGGBB hex codes
            names    = true,           -- "Name" codes like Blue
            RRGGBBAA = true,           -- #RRGGBBAA hex codes
            rgb_fn   = false,          -- CSS rgb() and rgba() functions
            hsl_fn   = false,          -- CSS hsl() and hsla() functions
            css      = false,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn   = true,           -- Enable all CSS *functions*: rgb_fn, hsl_fn
            -- Available modes: foreground, background
            mode     = "background",   -- Set the display mode.
           }
        }
    },
    "lambdalisue/suda.vim", -- Edit with su permission maintaining personal configuration
}