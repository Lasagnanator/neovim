return {
    {
        "folke/tokyonight.nvim",    -- Tokyonight Neovim theme
        opts = {
            style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "storm",  -- The theme is used when the background is set to light
            transparent = true,     -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "normal",          -- style for sidebars, see below
                floats = "dark",              -- style for floating windows
            },
            sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer", "help"]`
            day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false,             -- dims inactive windows
            lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
        },
        init = function()
            vim.cmd("colorscheme tokyonight")
        end,
        priority = 1000
    },
    {
        "Mofiqul/dracula.nvim", -- Dracula Neovim theme
        init = function()
            vim.g.dracula_colors = {
                bg = "#282A36",
                fg = "#F8F8F2",
                selection = "#44475A",
                comment = "#6272A4",
                red = "#FF5555",
                orange = "#FFB86C",
                yellow = "#F1FA8C",
                green = "#50fa7b",
                purple = "#BD93F9",
                cyan = "#8BE9FD",
                pink = "#FF79C6",
                bright_red = "#FF6E6E",
                bright_green = "#69FF94",
                bright_yellow = "#FFFFA5",
                bright_blue = "#D6ACFF",
                bright_magenta = "#FF92DF",
                bright_cyan = "#A4FFFF",
                bright_white = "#FFFFFF",
                menu = "#21222C",
                visual = "#3E4452",
                gutter_fg = "#4B5263",
                nontext = "#3B4048",
            }
            vim.g.dracula_show_end_of_buffer = true    -- show the '~' characters after the end of buffers
            vim.g.dracula_transparent_bg = true        -- use transparent background
            vim.g.dracula_lualine_bg_color = "#44475a" -- set custom lualine background color
            vim.g.dracula_italic_comment = true        -- set italic comment
            vim.cmd("colorscheme dracula")
        end,
        priority = 1000,
        enabled = false,
    },
    {
        "lunarvim/synthwave84.nvim", -- Synthwave '84 Neovim theme
        opts = {
            glow = {
                error_msg = true,
                type2 = true,
                func = true,
                keyword = true,
                operator = false,
                buffer_current_target = true,
                buffer_visible_target = true,
                buffer_inactive_target = true,
            }
        },
        init = function ()
            vim.cmd("colorscheme synthwave84")
        end,
        priority = 1000,
        enabled = false,
    },
}
