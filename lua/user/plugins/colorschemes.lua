return {
    {
        "folke/tokyonight.nvim", -- Tokyonight Neovim theme
        enabled = true,
        opts = {
            style = "night",
            transparent = true,
            styles = {
                sidebars = "normal",
                floats = "normal",
            },
            sidebars = { "qf", "help" },
        },
        init = function()
            vim.cmd("colorscheme tokyonight")
        end,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        enabled = false,
        name = "catppuccin",
        opts = {
            flavour = "macchiato",
            transparent_background = true,
        },
        init = function()
            vim.cmd("colorscheme catppuccin")
        end,
        priority = 1000,
    },
    {
        "Mofiqul/dracula.nvim", -- Dracula Neovim theme
        enabled = false,
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
    },
    {
        "lunarvim/synthwave84.nvim", -- Synthwave '84 Neovim theme
        enabled = false,
        config = true,
        init = function()
            vim.cmd("colorscheme synthwave84")
        end,
        priority = 1000,
    },
}
