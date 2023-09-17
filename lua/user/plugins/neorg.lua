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
                        }
                    }
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                        name = "[Neorg]"
                    },
                },
                ["core.export"] = {},
                ["core.export.markdown"] = {},
                ["core.summary"] = {},
            }
        }
    },
}
