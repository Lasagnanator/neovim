return {
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
                button("󰅙", "Quit", "q", "q!")
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
}
