return {
    {
        -- TODO: useless?
        "akinsho/toggleterm.nvim", -- Neovim's terminal wrapper
        opts = {
            open_mapping = [[<c-\>]],
            shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
        },
        init = function()
            Utils.set_keybinds(Keybinds.terminal())
        end,
    },
    {
        "Shatur/neovim-session-manager", -- Automatic session manager
        opts = {
            sessions_dir              = require("plenary.path"):new(vim.fn.stdpath('data'), 'sessions'), -- NOTE: not sure if useful
            autoload_mode             = "Disabled",
            autosave_ignore_dirs      = {},
            autosave_ignore_filetypes = {
                "gitcommit",
                "gitrebase",
            },
            autosave_ignore_buftypes  = {},
            autosave_only_in_session  = true,
        },
        init = function()
            Utils.set_keybinds(Keybinds.session())
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "stevearc/dressing.nvim", -- Interface for input prompts
        config = true,
    },
    {
        "numToStr/Comment.nvim", -- Easier commenting
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            padding = true,    -- Add a space b/w comment and the line
            sticky = true,     -- Whether the cursor should stay at its position
            ignore = nil,      -- Lines to be ignored while (un)comment
            -- toggler = Keybinds.comment().toggler,
            -- opleader = Keybinds.comment().opleader,
            -- extra = Keybinds.comment().extra,
            -- Enable keybindings
            -- NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                -- extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
            },
            pre_hook = nil,   -- Function to call before (un)comment
            post_hook = nil,  -- Function to call after (un)comment
        }
    },
    {
        "norcalli/nvim-colorizer.lua", -- Colorful hex codes, alternative?
        opts = {
            ['!lazy'] = {},
            ['!mason'] = {},
            ['*'] = {
                RGB      = true,         -- #RGB hex codes
                RRGGBB   = true,         -- #RRGGBB hex codes
                names    = true,         -- "Name" codes like Blue
                RRGGBBAA = true,         -- #RRGGBBAA hex codes
                rgb_fn   = false,        -- CSS rgb() and rgba() functions
                hsl_fn   = false,        -- CSS hsl() and hsla() functions
                css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = true,         -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode     = "background", -- Set the display mode.
            }
        }
    },
    {
        "lambdalisue/suda.vim", -- Edit with su permission maintaining personal configuration
        init = function()
            vim.g.suda_smart_edit = 1
        end
    }
}
