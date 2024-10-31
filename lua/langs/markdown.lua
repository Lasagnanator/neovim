if not Langs.markdown then return {} end

local utils = require("core.utils")

Treesitter:update({ "markdown", "markdown_inline" })
Mason:update("marksman")

require("lspconfig").marksman.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

utils.generate_from_template("obsidian.lua", "Missing default Obsidian configuration, generated from template")


return {
    -- TODO: add Obsidian plugin
    {
        "OXY2DEV/markview.nvim",
        enabled = true,
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
    {
        "epwalsh/obsidian.nvim",
        enabled = false,
        version = "*",
        ft = "markdown",
        opts = {
            workspaces = require("configurations.obsidian")
        },
        config = function(_, opts)
            if utils.is_wsl() then
                if vim.fn.executable("wsl-open") == 0 then
                    vim.notify("Missing wsl-open!")
                    return
                end
            end
            require("obsidian").setup(opts)
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
        }
    }
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
