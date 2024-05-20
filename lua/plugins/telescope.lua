return {
    "nvim-telescope/telescope.nvim",     -- File finder with filters
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
            "nvim-telescope/telescope-fzf-native.nvim",     -- fzf integration for Telescope
            build = "make",
        },
        "nvim-telescope/telescope-ui-select.nvim",     -- Use Telescope as a selector
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
}
