---@type LazySpec
return {
    {
        "neovim/nvim-lspconfig", -- Defaults for LSP
    },
    {
        "ray-x/lsp_signature.nvim", -- Shows signature of function while typing
        opts = {
            doc_lines            = 0,
            toggle_key           = require("keybinds.plugins.signature").toggle,
            select_signature_key = require("keybinds.plugins.signature").select_signature, -- cycle to next signature, e.g. '<M-n>' function overloading
            move_cursor_key      = require("keybinds.plugins.signature").move_cursor,      -- imap, use nvim_set_current_win to move cursor between current win and floating
            max_height           = 5,                                                      -- max height of signature floating_window
            max_width            = 80,                                                     -- max_width of signature floating_window
            hint_enable          = false,
            bind                 = true,                                                   -- Mandatory for window borders
            handler_opts         = {
                border = "none",
            },
        }
    },
    {
        "aznhe21/actions-preview.nvim",
        opts = {
            telescope = vim.tbl_extend("force",
                require("telescope.themes").get_dropdown(),
                {
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            height = 0.9,
                            width = 0.8
                        },
                    },
                    make_value = nil,
                    make_entry = nil
                })
        },
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "MunifTanjim/nui.nvim" -- Optional
        }
    },
    {
        "folke/neoconf.nvim",
        opts = {
            local_settings = ".nvim/neoconf.json"
        }
    },
    "b0o/schemastore.nvim", -- JSON schemas downloader for JSON and YAML LSPs
    "hrsh7th/cmp-nvim-lsp", -- Completion integration with LSP
}
