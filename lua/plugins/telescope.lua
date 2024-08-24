---@diagnostic disable: different-requires
return {
    "nvim-telescope/telescope.nvim", -- File finder with filters
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-j>"] = "move_selection_next",
                        ["<C-q>"] = "smart_add_to_qflist",
                        ["<C-s>"] = "smart_send_to_qflist",
                        ["<C-space>"] = "to_fuzzy_refine",
                    },
                    i = {
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-j>"] = "move_selection_next",
                        ["<C-q>"] = "smart_add_to_qflist",
                        ["<C-s>"] = "smart_send_to_qflist",
                        ["<C-space>"] = "to_fuzzy_refine",
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
                    previewer = true,
                    hidden = { file_browser = true, folder_browser = true },
                    -- respect_gitignore = vim.fn.executable "fd" == 1,
                    -- no_ignore = false,
                    mappings = {
                        i = {
                            ["<Tab>"] = "select_default",
                        }
                    }
                },
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-a>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                        }
                    }
                }
            }
        })
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")
        telescope.load_extension("telescope-tabs")
        telescope.load_extension("remote-sshfs")
        telescope.load_extension("live_grep_args")
        require("keybinds.plugins.telescope"):set()
    end,
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "LukasPietzschmann/telescope-tabs",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
}
