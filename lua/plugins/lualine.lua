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
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = excluded_buffers,
            always_divide_middle = true,
            globalstatus = false,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                {
                    "filename",
                    path = 1,
                    newfile_status = true,
                },
            },
            lualine_x = {
                "searchcount",
                "selectioncount",
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                },
                "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" }
        },
    },
    init = function()
        require("keybinds.plugins.lualine"):set()
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
