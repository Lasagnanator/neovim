---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    priority = Priority.treesitter,
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function ()
        local ts = require("nvim-treesitter")
        ts.setup()
        ts.install(Treesitter.parsers)
    end
}
