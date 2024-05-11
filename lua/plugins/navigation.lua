return {
    {
        "nvim-tree/nvim-tree.lua", -- File navigation
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local nvim_tree          = require("nvim-tree")
            local api                = require("nvim-tree.api")
            --<< Settings
            vim.g.loaded_netrw       = 1
            vim.g.loaded_netrwPlugin = 1
            --<< Function
            local function on_attach(bufnr)
                -- Set defaults
                api.config.mappings.default_on_attach(bufnr)

                -- Remove from defaults
                vim.keymap.set('n', '<C-[>', '', { buffer = bufnr })
                vim.keymap.set('n', '<C-]>', '', { buffer = bufnr })
                vim.keymap.del('n', '<C-[>', { buffer = bufnr })
                vim.keymap.del('n', '<C-]>', { buffer = bufnr })

                -- Set keybinds
                Utils.set_keybinds(Keybinds.nvimtree(bufnr).on_attach)
            end
            nvim_tree.setup({
                on_attach = on_attach,
                tab = {
                    sync = {
                        open = true,
                        close = true,
                        ignore = {},
                    }
                },
            })
            --<< Keys
            Utils.set_keybinds(Keybinds.nvimtree().common)
        end,
    },
    {
        "stevearc/oil.nvim",
        lazy = false,
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    "permissions",
                    "size"
                },
                constrain_cursor = "name",
            })
        end,
        keys = require("keybinds.plugins.oil"):to_lazy(),
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup({
                global_settings = {
                    enter_on_sendcmd = true
                }
            })
            require("keybinds.plugins.harpoon"):set()
            vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "TelescopeBorder" })
            vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "TelescopeNormal" })
        end,
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-telescope/telescope.nvim", -- File finder with filters
        opts = {
            defaults = {
                mappings = {
                    n = {
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-j>"] = "move_selection_next",
                        ["<C-q>"] = "smart_add_to_qflist",
                        ["<C-s>"] = "smart_send_to_qflist",
                    },
                    i = {
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-j>"] = "move_selection_next",
                        ["<C-q>"] = "smart_add_to_qflist",
                        ["<C-s>"] = "smart_send_to_qflist",
                    },
                },
                layout_config = {
                    prompt_position = "top"
                },
                sorting_strategy = "ascending"
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
                },
                buffers = {
                    mappings = {
                        i = {
                            ["<C-b>"] = "delete_buffer",
                        },
                        n = {
                            ["<C-b>"] = "delete_buffer",
                        },
                    }
                }
            },
            extensions = {
                file_browser = {
                    theme = "ivy",
                    previewer = false
                }
            }
        },
        init = function()
            local telescope = require("telescope")
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            telescope.load_extension("file_browser")
            require("keybinds.plugins.telescope"):set()
        end,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- fzf integration for Telescope
                build = "make",
            },
            "nvim-telescope/telescope-ui-select.nvim", -- Use Telescope as a selector
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        "SmiteshP/nvim-navbuddy",
        opts = {
            lsp = {
                auto_attach = true
            }
        },
        event = { "BufReadPre", "BufNewFile" },
        keys = require("keybinds.plugins.navbuddy"):to_lazy(),
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        },
    }
}
