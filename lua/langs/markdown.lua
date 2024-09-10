if not Langs.markdown then return {} end

local utils = require("core.utils")

Treesitter:update({ "markdown", "markdown_inline" })
Mason:update("marksman")

require("lspconfig").marksman.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {
    -- TODO: add Obsidian plugin
    {
        "OXY2DEV/markview.nvim",
        enabled = true,
        opts = {
            modes = { "n", "i", "no", "c", "v", "V", "" },
            hybrid_modes = { "i", "v", "V", "" },

            -- This is nice to have
            callbacks = {
                on_enable = function(_, win)
                    vim.wo[win].conceallevel = 2;
                    vim.wo[win].concealcursor = "nc";
                end
            }
        },
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },
    -- TODO: remove the following plugins if markdown.nvim is worth it
    {
        "jghauser/follow-md-links.nvim"
    },
    {
        "richardbizik/nvim-toc",
        opts = {
            toc_header = "Table of Contents"
        },
        ft = { "markdown" }
    },
    {
        "tadmccorkle/markdown.nvim",
        enabled = false,
        ft = "markdown",
        config = true,
    },
    -- WARN: abandoned, maybe change with peek.nvim
    -- {
    --     "iamcco/markdown-preview.nvim", -- Preview markdown files in browser
    --     build = "app/install.sh",
    --     init = function()
    --         vim.g.mkdp_filetypes = { "markdown" }
    --     end,
    --     ft = { "markdown" }
    -- },
}
