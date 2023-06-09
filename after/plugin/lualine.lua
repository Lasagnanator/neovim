--<< LUALINE >>--

--<< Protected call
local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
    return
end

--<< Setup
lualine.setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            { "filename",
                path = 1,
                newfile_status = true,
            },
        },
        lualine_x = {
            "encoding",
            { "fileformat",
                symbols = {
                    unix = " ", -- e712
                    dos = " ",  -- e70f
                    mac = " ",  -- e711
                },
            },
            "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
}
