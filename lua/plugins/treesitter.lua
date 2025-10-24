---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup()
        ts.install(Treesitter.parsers)
        local au_treesitter = vim.api.nvim_create_augroup("treesitter", { clear = true })
        vim.api.nvim_create_autocmd("Filetype", {
            desc = "Start treesitter functions",
            group = au_treesitter,
            callback = function(args)
                local buf = args.buf
                local filetype = args.match
                local language = vim.treesitter.language.get_lang(filetype) or filetype
                if not vim.treesitter.language.add(language) then return end
                -- Indent
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                -- Highlight
                vim.treesitter.start()
            end,
        })
    end,
    build = ":TSUpdate",
    lazy = false,
    priority = Priority.treesitter,
}
