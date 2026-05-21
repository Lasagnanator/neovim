if not Langs.datastar then return {} end

---@type LazySpec
return {
    "WillEhrendreich/datastar.nvim",
    branch = "master",
    opts = {},
    ft = "html",
    dependencies = {
        {
            "saghen/blink.cmp",
            opts = {
                sources = {
                    default = { "datastar" },
                    providers = {
                        datastar = {
                            name = "datastar",
                            module = "datastar.cmp_source",
                            score_offset = 1,
                        },
                    },
                },
            },
        },
    },
}
