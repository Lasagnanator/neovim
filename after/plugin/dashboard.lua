--<< DASHBOARD >>--

--<< Protected call
local dashboard_status, dashboard = pcall(require, "dashboard")
if not dashboard_status then
    return
end

--<< Settings
dashboard.setup({
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
})

