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
        "nvim-telescope/telescope.nvim", -- File finder with filters
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-j>"] = "move_selection_next",
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
                },
                buffers = {
                    -- TODO: check if a better map is possible
                    mappings = {
                        i = {
                            ["<C-q>"] = "delete_buffer",
                        },
                        n = {
                            ["<C-q>"] = "delete_buffer",
                        },
                    }
                }
            },
        },
        init = function()
            local telescope = require("telescope")
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            Utils.set_keybinds(Keybinds.telescope().common)
        end,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- fzf integration for Telescope
                build = "make",
            },
            "nvim-telescope/telescope-ui-select.nvim", -- Use Telescope as a selector
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context", -- Shows which function are you editing on the first line of the screen
        opts = {
            enable = true,
            max_lines = 3,
            multiline_threshold = 20,
            trim_scope = 'outer',
            mode = 'cursor', -- or "topline"
        }
    },
}
