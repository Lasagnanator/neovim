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
                            work = "~/notes/work",
                            home = "~/notes/home",
                        },
                        default_workspace = "home",
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
                ["core.export"] = {},
                ["core.summary"] = {},
                ["external.context"] = {},
            },
        },
        dependencies = { "max397574/neorg-contexts" },
    },
}
