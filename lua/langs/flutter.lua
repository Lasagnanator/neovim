if not Langs.flutter.enabled then return {} end

Treesitter:update("dart")

return {
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = true,
    }
}
