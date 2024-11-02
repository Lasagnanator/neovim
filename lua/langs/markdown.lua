if not Langs.markdown then return {} end

local utils = require("core.utils")

Treesitter:update({ "markdown", "markdown_inline" })
Mason:update("marksman")

require("lspconfig").marksman.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {
    {
        "OXY2DEV/markview.nvim",
        cond = true,
        opts = {
            modes = { "n", "i", "no", "c", "v", "V", "" },
            hybrid_modes = { "n", "i", "v", "V", "" },

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
    {
        "jghauser/follow-md-links.nvim",
        ft = "markdown"
    },
    {
        "tadmccorkle/markdown.nvim",
        opts = {
            on_attach = function ()
                require("keybinds.filetypes.markdown").tools:bufset()
            end
        },
        config = true,
        ft = "markdown",
    },
    {
        "iamcco/markdown-preview.nvim", -- Preview markdown files in browser
        build = "app/install.sh",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = "markdown"
    },
}
