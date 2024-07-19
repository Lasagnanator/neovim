if not Langs.restapi then return {} end

Treesitter:update("hurl")

return {
    "jellydn/hurl.nvim",
    opts = {
        -- Show debugging info
        debug = false,
        -- Show notification on run
        show_notification = false,
        -- Show response in popup or split
        mode = "split",
        -- Default formatter
        formatters = {
            json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
            html = {
                'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                '--parser',
                'html',
            },
            xml = {
                'tidy', -- Make sure you have installed tidy in your system, e.g: brew install tidy-html5
                '-xml',
                '-i',
                '-q',
            },
        },
    },
    ft = "hurl",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
}
