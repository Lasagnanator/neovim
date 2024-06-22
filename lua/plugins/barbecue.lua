-- TODO: evaluate global
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
    -- WARN: Remove plugin if Dropbar is worth
    enabled = false,
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
}
