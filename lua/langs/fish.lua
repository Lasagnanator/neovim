if not Langs.fish then return {} end

Treesitter:update("fish")

return {
    "khaveesh/vim-fish-syntax",     -- Fish LSP
    ft = { "fish" },
}
