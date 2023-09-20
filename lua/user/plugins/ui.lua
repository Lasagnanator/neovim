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
        "nanozuki/tabby.nvim",
        config = function()
            local theme = {
                fill = 'TabLineFill',
                head = 'lualine_a_visual',
                current_tab = 'lualine_a_normal',
                tab = 'lualine_b_normal',
                current_win = 'lualine_a_normal',
                win = 'lualine_b_normal',
                tail = 'lualine_a_visual',
            }

            require('tabby.tabline').set(function(line)
                return {
                    {
                        { ' 󰮯 ', hl = theme.head },
                        line.sep('', theme.head, theme.fill),
                    },
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        return {
                            line.sep('', hl, theme.fill),
                            tab.is_current() and '' or '󰆣',
                            tab.number(),
                            tab.name(),
                            line.sep('', hl, theme.fill),
                            hl = hl,
                            margin = ' ',
                        }
                    end),
                    line.spacer(),
                    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                        local hl = win.is_current() and theme.current_win or theme.tab
                        return {
                            line.sep('', hl, theme.fill),
                            win.is_current() and '' or '',
                            win.buf_name(),
                            line.sep('', hl, theme.fill),
                            hl = hl,
                            margin = ' ',
                        }
                    end),
                    {
                        line.sep('', theme.tail, theme.fill),
                        { '   ', hl = theme.tail },
                    },
                    hl = theme.fill,
                }
            end, {
            buf_name = {
                mode = "unique"
            },
        })
        end,
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
