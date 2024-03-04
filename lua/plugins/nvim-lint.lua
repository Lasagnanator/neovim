return {
    "mfussenegger/nvim-lint",
    config = function()
        vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end
}
