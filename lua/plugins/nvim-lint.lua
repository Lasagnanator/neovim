---@type LazySpec
return {
    "mfussenegger/nvim-lint",
    branch = "master",
    config = function()
        require("lint").linters_by_ft = vim.empty_dict()
        vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
    event = { "BufReadPre", "BufNewFile" }
}
