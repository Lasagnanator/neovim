if not Langs.markdown then return {} end

Treesitter:update({ "markdown", "markdown_inline" })

return {
    {
        "iamcco/markdown-preview.nvim", -- Preview markdown files in browser
        build = "app/install.sh",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    },
    {
        "richardbizik/nvim-toc",
        opts = {
            toc_header = "Table of Contents"
        },
        ft = { "markdown" }
    }
}
