-- NOTE: big WIP, highly unstable
-- Right now many problems with the interactions with other plugins, like Noice (on confirm of org-roam windows)
if not Langs.orgmode then return {} end

Treesitter:update("org")

return {
    {
        'nvim-orgmode/orgmode',
        -- TODO: change keybinds
        -- TODO: configure roam
        -- TODO: fix org-roam confirmation prompts
        opts = {
            org_agenda_files = os.getenv("HOME") .. "/org/**/*",
            org_default_notes_file = os.getenv("HOME") .. "/orgfiles/refile.org",
            ui = {
                menu = {
                    -- NOTE: vim.notify example at https://github.com/nvim-orgmode/orgmode/blob/master/DOCS.md#menu
                    handler = function(data)
                        require("org-modern.menu"):new({
                            window = {
                                margin = { 1, 0, 1, 0 },
                                padding = { 0, 1, 0, 1 },
                                title_pos = "center",
                                border = "single",
                                zindex = 1000,
                            },
                            icons = {
                                separator = "➜",
                            },
                        }):open(data)
                    end,
                },
            },
        },
        dependencies = {
            "danilshvalov/org-modern.nvim"
        }
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
