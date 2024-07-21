local excluded_buffers = {
    "NvimTree",
    "TelescopePrompt",
    "DressingInput",
    "Trouble",
    "mason",
    "lazy",
    "help",
    "wiki",
    "DiffviewFiles",
    "qf",
    "toggleterm",
    "alpha",
    "dbui",
    "dbout",
    "norg"
}

return {
    "nvim-lualine/lualine.nvim", -- Custom statusline written in Lua
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = "",
            section_separators = "",
            disabled_filetypes = excluded_buffers,
            always_divide_middle = true,
            globalstatus = false,
        },
        sections = {
            lualine_a = {
                {
                    function()
                        return " "
                    end,
                    padding = 0
                }
            },
            lualine_b = {
                {
                    "branch",
                    icon = ""
                },
                "diff"
            },
            lualine_c = {
                {
                    "filename",
                    path = 1,
                    newfile_status = true,
                },
                "diagnostics",
            },
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                },
                "filetype",
                "progress",
                "location"
            },
            lualine_y = {
                {
                    "tabs",
                    show_modified_status = true,
                    symbols = {
                        modified = '+',
                    },
                },
            },
            lualine_z = {
                {
                    function()
                        return " "
                    end,
                    padding = 0
                }
            },
        },
    },
    init = function()
        require("keybinds.plugins.lualine"):set()
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
