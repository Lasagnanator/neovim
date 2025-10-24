local excluded_buffers = {
    "NvimTree",
    "mason",
    "lazy",
    "help",
    "wiki",
    "DiffviewFiles",
    "qf",
    "toggleterm",
    "alpha",
    "diff",
    "undotree",
}

---@type LazySpec
return {
    "nvim-lualine/lualine.nvim",
    branch = "master",
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
                    function() return " " end,
                    padding = 0,
                },
            },
            lualine_b = {
                {
                    "branch",
                    icon = "",
                },
                "diff",
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
                    require("lazy.status").updates, -- Plugin updates
                    cond = require("lazy.status").has_updates,
                },
                -- TODO: add JSON schema component, impossible ATM
                {
                    function() -- Yaml schema name
                        local schema = require("schema-companion").get_current_schemas()
                        if schema == nil then return "" end
                        return "󰘦 " .. schema
                    end,
                },
                "filetype",
                "progress",
                "location",
            },
            lualine_y = {
                {
                    "tabs",
                    show_modified_status = true,
                    symbols = {
                        modified = "+",
                    },
                },
            },
            lualine_z = {
                {
                    function() return " " end,
                    padding = 0,
                },
            },
        },
    },
    lazy = false,
    keys = require("keybinds.plugins.lualine"):to_lazy(),
    dependencies = { "nvim-mini/mini.icons" },
}
