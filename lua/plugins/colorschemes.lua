--<< Dinamic options functions
local function isChosenColorscheme(colorscheme)
    return colorscheme == Colorscheme
end

local function isNeovide()
    return not vim.g.neovide == true -- Negation should handle undefined case better
end

return {
    {
        "folke/tokyonight.nvim", -- Tokyonight Neovim theme
        enabled = isChosenColorscheme("tokyonight"),
        opts = {
            style = "night",
            transparent = isNeovide(),
            styles = {
                sidebars = "normal",
                floats = "normal",
            },
            sidebars = { "qf", "help" },
        },
        init = function()
            vim.cmd("colorscheme tokyonight")
        end,
        priority = Priority.colorscheme,
    },
    {
        "catppuccin/nvim",
        enabled = isChosenColorscheme("catppuccin"),
        name = "catppuccin",
        opts = {
            flavour = "macchiato",
            transparent_background = isNeovide(),
        },
        init = function()
            vim.cmd("colorscheme catppuccin")
        end,
        priority = Priority.colorscheme,
    },
    {
        "Mofiqul/dracula.nvim", -- Dracula Neovim theme
        enabled = isChosenColorscheme("dracula"),
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
            vim.g.dracula_transparent_bg = isNeovide()        -- use transparent background
            vim.g.dracula_lualine_bg_color = "#44475a" -- set custom lualine background color
            vim.g.dracula_italic_comment = true        -- set italic comment
            vim.cmd("colorscheme dracula")
        end,
        priority = Priority.colorscheme,
    },
    {
        "lunarvim/synthwave84.nvim", -- Synthwave '84 Neovim theme
        enabled = isChosenColorscheme("synthwave84"),
        config = true,
        init = function()
            vim.cmd("colorscheme synthwave84")
        end,
        priority = Priority.colorscheme,
    },
}
