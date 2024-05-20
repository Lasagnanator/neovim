return {
    "nvim-tree/nvim-tree.lua",     -- File navigation
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        --<< Settings
        vim.g.loaded_netrw       = 1
        vim.g.loaded_netrwPlugin = 1
        --<< Function
        local function on_attach(bufnr)
            -- Set defaults
            require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
            -- Remove from defaults
            vim.keymap.set('n', '<C-[>', '', { buffer = bufnr })
            vim.keymap.set('n', '<C-]>', '', { buffer = bufnr })
            vim.keymap.del('n', '<C-[>', { buffer = bufnr })
            vim.keymap.del('n', '<C-]>', { buffer = bufnr })
            -- Set keybinds
            require("keybinds.plugins.nvimtree").on_attach(bufnr):set()
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
        })
        --<< Keys
        require("keybinds.plugins.nvimtree").global:set()
    end,
}
