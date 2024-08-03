if not Langs.orgmode then return {} end

Treesitter:update("org")

return {
    {
        'nvim-orgmode/orgmode',
        ft = { 'org' },
        config = function()
            require('orgmode').setup({
                org_agenda_files = os.getenv("HOME") .. "/org/**/*",
                org_default_notes_file = os.getenv("HOME") .. "/orgfiles/refile.org",
            })
        end,
    },
    {
        "chipsenkbeil/org-roam.nvim",
        opts = {
            directory = os.getenv("HOME") .. "/org",
        },
        dependencies = {
            "nvim-orgmode/orgmode",
        },
    },
    {
        "nvim-orgmode/org-bullets.nvim",
        config = function()
            require("org-bullets").setup()
        end,
        ft = { "org" },
        dependencies = {
            "nvim-orgmode/orgmode",
        },
    },
    {
        "massix/org-checkbox.nvim",
        opts = {
            lhs = "<Leader>mc"
        },
        ft = { "org" },
        dependencies = {
            "nvim-orgmode/orgmode",
        },
    }
}
