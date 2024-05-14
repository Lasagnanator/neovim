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
    {
        "nvim-tree/nvim-web-devicons",
        opt = {
            default = true,
            color_icons = true,
        }
    },
    {
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
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        opts = {
            show_dirname = false,
            exclude_filetypes = excluded_buffers,
        },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                mode = "buffers",
                tab_size = 25,
                max_name_length = 25,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
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
                    local in_tab = false
                    for _, buffer in pairs(vim.fn.tabpagebuflist()) do
                        if buffer == buffer_number then
                            in_tab = true
                        end
                    end
                    local ft = vim.bo[buffer_number].filetype
                    if in_tab
                        and ft ~= "NvimTree"
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
                        and ft ~= "Alpha"
                        and ft ~= "dbui"
                        and ft ~= "dbout"
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
                        -- separator = true,
                    },
                    {
                        filetype = "dbui",
                        text = "Dadbod UI",
                        highlight = "TabLineSel",
                        text_align = "center",
                        -- separator = true,
                    },
                },
                show_buffer_icons = true,
                get_element_icon = function(buf) return require('nvim-web-devicons').get_icon(buf, { default = true }) end,
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "slant",
                always_show_bufferline = true,
                enforce_regular_tabs = true,
                sort_by = "tabs",
            }
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local ascii_name = "skull"
            local ver = vim.version()
            local alpha = require("alpha")

            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                command = "set showtabline=0"
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaClosed",
                command = "set showtabline=2"
            })

            local padding = {
                type = "padding",
                val = 2
            }

            local header = {
                type = "text",
                val = function()
                    local text = {}
                    local path = vim.fs.normalize(vim.fn.stdpath("config") .. "/nvim-headers/" .. ascii_name .. ".txt")
                    for line in io.lines(path) do
                        table.insert(text, line)
                    end
                    return text
                end,
                opts = {
                    position = "center",
                    hl = "Function"
                }
            }

            local info = {
                type = "group",
                val = {
                    {
                        type = "text",
                        val = "Gun revision " .. ver.major .. "." .. ver.minor .. "." .. ver.patch
                    },
                    {
                        type = "text",
                        val = ""
                    },
                    {
                        type = "text",
                        val = ""
                    }
                },
                opts = {
                    inherit = {
                        position = "center",
                        hl = "statement"
                    }
                }
            }

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local time = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    alpha.default_config.layout[4].val[2].val = stats.loaded .. " bullets loaded out of " .. stats.count
                    alpha.default_config.layout[4].val[3].val = "Machinegun ready in " .. time .. " ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })

            local function button(icon, label, shortcut, command)
                return {
                    type = "button",
                    val = icon .. "   " .. label,
                    on_press = function() vim.cmd(command) end,
                    opts = {
                        shortcut = string.upper(shortcut),
                        keymap = { "n", shortcut, "<Cmd>" .. command .. "<CR>",
                            { noremap = true, silent = true, nowait = true } },
                        position = "center",
                        align_shortcut = "right",
                        -- hl = "Statement",
                        hl_shortcut = "Title",
                        width = 25,
                        shrink_margin = true,
                    }
                }
            end

            local buttons = {
                type = "group",
                val = {
                    button("", "Files", "f", "Telescope find_files"),
                    button("", "Session", "s", "SessionManager load_current_dir_session"),
                    button("󰴓", "Notes", "n", "Neorg index"),
                    button("󰠮", "Logbook", "l", "Neorg journal toc open"),
                    button("", "Neogit", "g", ""),
                    button("󰏇", "Explorer", "e", "Oil"),
                    button("", "Word", "w", "Telescope live_grep"),
                    button("", "Quit", "q", "q!")
                },
            }

            local footer = {
                type = "text",
                val = "I am a testament to all your sins.",
                opts = {
                    position = "center",
                    hl = "Constant"
                }
            }

            local margin = {
                type = "padding",
                val = function()
                    local height = vim.api.nvim_win_get_height(0)
                    local occupied = #header.val() + #info.val + #buttons.val + 1 + padding.val * 3
                    local value = math.floor((height - occupied) / 2)
                    return value >= 0 and value or 0
                end
            }


            alpha.setup({
                layout = {
                    margin,
                    header,
                    padding,
                    info,
                    padding,
                    buttons,
                    padding,
                    footer
                },
            })
            require("keybinds.plugins.alpha"):set()
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.register(require("keybinds.whichkey"))
        end
    }
}
