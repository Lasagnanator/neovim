return {
    {
        "nvim-tree/nvim-tree.lua", -- File navigation
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            local nvim_tree          = require("nvim-tree")
            local api                = require("nvim-tree.api")
            local keymap             = vim.keymap.set
            local keymap_remove      = vim.keymap.del
            local silent             = { noremap = true, silent = true }
            --<< Settings
            vim.g.loaded_netrw       = 1
            vim.g.loaded_netrwPlugin = 1
            --<< Function
            local function on_attach(bufnr)
                local function opts(desc)
                    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                -- Set defaults
                api.config.mappings.default_on_attach(bufnr)

                -- Remove from defaults
                keymap('n', '<C-[>', '', { buffer = bufnr })
                keymap('n', '<C-]>', '', { buffer = bufnr })
                keymap_remove('n', '<C-[>', { buffer = bufnr })
                keymap_remove('n', '<C-]>', { buffer = bufnr })

                -- Set keybinds
                keymap('n', '}', api.tree.change_root_to_node, opts('CD'))
                keymap('n', '{', api.tree.change_root_to_parent, opts('Up'))
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
            keymap("n", "<Leader>ee", function()
                api.tree.toggle({
                    focus = false
                })
            end, silent)
            keymap("n", "<Leader>ew", api.tree.focus, silent)
        end,
    },
    {
        "nvim-telescope/telescope.nvim", -- File finder with filters
        opts = {
            defaults = {},
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
                },
                buffers = {
                    --TODO: check if a better map is possible
                    mappings = {
                        i = {
                            ["<C-k>"] = "delete_buffer",
                        },
                        n = {
                            ["<C-k>"] = "delete_buffer",
                        },
                    }
                }
            },
        },
        init = function()
            local telescope = require("telescope")
            local keymap  = vim.keymap.set
            local silent  = { noremap = true, silent = true }
            local builtin = require("telescope.builtin")

            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")
            telescope.load_extension("ui-select")

            local find_git_fallback = function()
                vim.fn.system('git rev-parse --is-inside-work-tree')
                if vim.v.shell_error == 0 then
                    builtin.git_files()
                else
                    builtin.find_files()
                end
            end

            local file_browser = telescope.extensions.file_browser.file_browser

            --<< Keys
            keymap("n", "<Leader>ff", builtin.find_files, silent)
            keymap("n", "<Leader>fw", builtin.live_grep, silent)
            keymap("n", "<Leader>fb", builtin.buffers, silent)
            keymap("n", "<Leader>fh", builtin.help_tags, silent)
            keymap("n", "<Leader>fg", find_git_fallback, silent)
            keymap("n", "<Leader>fe", file_browser, silent)
            keymap("n", "<Leader>ls", function()
                builtin.lsp_references({
                    include_current_line = true,
                })
            end, silent)
        end,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- fzf integration for Telescope
                build = "make",
                -- "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            },
            -- TODO: Useful with nvim_tree?
            "nvim-telescope/telescope-file-browser.nvim", -- File browser extension for Telescope
            -- Not needed
            "nvim-telescope/telescope-ui-select.nvim",    -- Use Telescope as a selector
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons"
        },
    },
}
