return {
    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {
                    config = {
                        icon_preset = "diamond",
                    },
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/neorg/notes",
                            logbook = "~/neorg/logbook",
                        },
                        default_workspace = "notes",
                    }
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.qol.toc"] = {
                    config = {
                        close_after_use = true,
                    }
                },
                ["core.journal"] = {
                    config = {
                        journal_folder = ".",
                        workspace = "logbook"
                    }
                },
                ["core.export"] = {},
                ["core.summary"] = {},
                -- ["external.context"] = {},
            },
        },
        init = function() require("keybinds.plugins.neorg"):set() end,
        dependencies = {
            "vhyrro/luarocks.nvim",
            config = true
        },
    },
}
