---@type LazySpec
return {
    "nvim-tree/nvim-tree.lua", -- File navigation
    version = "*",
    config = function()
        vim.g.loaded_netrw       = 1
        vim.g.loaded_netrwPlugin = 1
        local function on_attach(bufnr)
            -- Set defaults
            require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
            -- Remove from defaults
            vim.keymap.set('n', '<C-[>', '', { buffer = bufnr })
            vim.keymap.set('n', '<C-]>', '', { buffer = bufnr })
            vim.keymap.del('n', '<C-[>', { buffer = bufnr })
            vim.keymap.del('n', '<C-]>', { buffer = bufnr })
            -- Set keybinds
            require("keybinds.plugins.nvim-tree").on_attach(bufnr):set()
        end
        require("nvim-tree").setup({
            on_attach = on_attach,
            tab = {
                sync = {
                    open = true,
                    close = true,
                    ignore = {},
                }
            },
            renderer = {
                group_empty = true
            },
            update_focused_file = {
                enable = true,
            }
        })
        --<< Keys
        require("keybinds.plugins.nvim-tree").global:set()
    end,
    dependencies = { "nvim-mini/mini.icons" },
}
