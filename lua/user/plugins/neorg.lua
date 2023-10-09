return {
    {
        "nvim-neorg/neorg",
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
                ["external.context"] = {},
            },
        },
        dependencies = { "max397574/neorg-contexts" },
    },
}
