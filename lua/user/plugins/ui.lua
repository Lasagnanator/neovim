return {
    {
        "nvim-lualine/lualine.nvim", -- Custom statusline written in Lua
        opts = {
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
                    {
                        "filename",
                        path = 1,
                        newfile_status = true,
                    },
                },
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                    },
                    "encoding",
                    -- {
                    --     "fileformat",
                    --     symbols = {
                    --         unix = " ", -- e712
                    --         dos = " ", -- e70f
                    --         mac = " ", -- e711
                    --     },
                    -- },
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
        },
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    {
        -- TODO: Find alternative
        "akinsho/bufferline.nvim", -- Custom bufferline/tagline written in lua
        opts = {
            options = {
                mode = "tabs",
                numbers = "none",
                indicator = {
                    style = "none",
                },
                max_name_length = 20,
                max_prefix_length = 15,   -- prefix used when a buffer is de-duplicated
                tab_size = 20,
                diagnostics = "nvim_lsp", -- false or "nvim_lsp"
                diagnostics_update_in_insert = false,
                -- diagnostics_indicator = function(count, level)
                --     local icon = level:match("error") and " " or " " -- Equivalent to a if with the match as a condition
                --     return " " .. count .. icon
                ---@diagnostic disable-next-line: unused-local
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                            or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return s
                end,
                name_formatter = function(buf)
                    return " " .. buf.name
                end,
                custom_filter = function(buffer_number)
                    local ft = vim.bo[buffer_number].filetype
                    if ft ~= "NvimTree"
                        and ft ~= "TelescopePrompt"
                        and ft ~= "DressingInput"
                        and ft ~= "Trouble"
                        and ft ~= "mason"
                        and ft ~= "packer"
                        and ft ~= "help"
                        and ft ~= "wiki"
                        and ft ~= "DiffviewFiles"
                        and ft ~= "qf"
                        and ft ~= "toggleterm"
                    then
                        return true
                    end
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        highlight = "TabLineSel",
                        text_align = "center",
                        separator = true,
                    },
                },
                color_icons = true,       -- whether or not to add the filetype icon highlights
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = false,
                -- show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
                -- get_element_icon = function(buf) return require('nvim-web-devicons').get_icon(buf, {default = false}) end,
                -- buffer_close_icon = '',
                show_close_icon = false,
                -- show_tab_indicators = true,
                separator_style = { "", "" },
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                hover = { enabled = true, reveal = { "close" } },
                sort_by = "tabs",
            }
        },
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    {
        "glepnir/dashboard-nvim", -- Customize the opening screen
        opts = {
            theme = "doom",
            hide = {
                statusline = true,
                tabline = true,
                winbar = true,
            },
            -- preview = {
            --     command = "cat",
            --     file_path = vim.fn.stdpath("config") .. "/nvim-headers/skull.txt",
            --     file_height = 19,
            --     file_width = 70,
            -- },
            config = {
                header = {
                    [[]],
                    [[]],
                    [[]],
                    [[]],
                    [[]],
                    [[    .o oOOOOOOOo                                            0OOOo     ]],
                    [[    Ob.OOOOOOOo  OOOo.      oOOo.                      .adOOOOOOO     ]],
                    [[    OboO000000000000.OOo. .oOOOOOo.    OOOo.oOOOOOo..0000000000OO     ]],
                    [[    OOP.oOOOOOOOOOOO 0POOOOOOOOOOOo.   `0OOOOOOOOOP,OOOOOOOOOOOB'     ]],
                    [[    `O'OOOO'     `OOOOo"OOOOOOOOOOO` .adOOOOOOOOO"oOOO'    `OOOOo     ]],
                    [[    .OOOO'            `OOOOOOOOOOOOOOOOOOOOOOOOOO'            `OO     ]],
                    [[    OOOOO                 '"OOOOOOOOOOOOOOOO"`                oOO     ]],
                    [[   oOOOOOba.                .adOOOOOOOOOOba               .adOOOOo.   ]],
                    [[  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO  ]],
                    [[  OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOO"`  '"OOOOOOOOOOOOO.OOOOOOOOOOOOOO  ]],
                    [[    :            .oO%OOOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .      ]],
                    [[    Y           'OOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?'         :`     ]],
                    [[    .            oOOP"%OOOOOOOOoOOOOOOO?oOOOOO?OOOO"OOo               ]],
                    [[                 '%o  OOOO"%OOOO%"%OOOOO"OOOOOO"OOO':                 ]],
                    [[                      `$"  `OOOO' `O"Y ' `OOOO'  o             .      ]],
                    [[    .                  .     OP"          : o     .                   ]],
                    [[]],
                    [[]],
                    [[]],
                    [[]],
                    [[]],
                },
                center = {
                    {
                        icon = "   ",
                        desc = "New file",
                        key = "n",
                        action = "enew"
                    },
                    {
                        icon = "   ",
                        desc = "Restore last session",
                        key = "l",
                        action = "SessionManager load_last_session"
                    },
                    {
                        icon = "   ",
                        desc = "Restore directory session",
                        key = "s",
                        action = "SessionManager load_current_dir_session"
                    },
                    {
                        icon = "   ",
                        desc = "Search folder",
                        key = "f",
                        action = "Telescope find_files"
                    },
                    {
                        icon = "   ",
                        desc = "Find word",
                        key = "w",
                        action = "Telescope live_grep"
                    },
                    {
                        icon = "   ",
                        desc = "File browser",
                        key = "e",
                        action = "Telescope file_browser"
                    },
                    {
                        icon = "   ",
                        desc = "Quit Neovim",
                        key = "q",
                        action = ":q!"
                    },
                },
                footer = {
                    [[]],
                    [[]],
                    [[]],
                    [[ I am a monument to all your sins. ]],
                },
            },
        },
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },
}
