---@type LazySpec
return {
    "stevearc/conform.nvim",
    version = "*",
    opts = {
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    event = { "BufReadPre", "BufNewFile" },
}
