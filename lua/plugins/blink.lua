local excluded_filetypes = {
    "oil",
}

---@type LazySpec
return {
    "saghen/blink.cmp",
    version = "*",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        enabled = function() return not vim.tbl_contains(excluded_filetypes, vim.bo.filetype) end,
        keymap = {
            preset = "none",
            ["<C-space>"] = { "show", "hide", "fallback" },
            ["<C-e>"] = { "show_documentation", "hide_documentation", "fallback" },
            ["<CR>"] = { "select_and_accept", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            trigger = {
                show_in_snippet = true,
            },
            list = {
                selection = {
                    preselect = false,
                },
            },
            documentation = {
                auto_show = false,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                org = { "orgmode" },
            },
            providers = {
                orgmode = {
                    name = "Orgmode",
                    module = "orgmode.org.autocompletion.blink",
                    fallbacks = { "buffer" },
                },
            },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    opts_extend = { "sources.default" },
    dependencies = { "rafamadriz/friendly-snippets" },
}
