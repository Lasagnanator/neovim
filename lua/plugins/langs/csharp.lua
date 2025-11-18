if not Langs.csharp then return {} end

---@type LazySpec
return {
    "seblyng/roslyn.nvim",
    ---@module "roslyn.config"
    ---@type RoslynNvimConfig
    opts = {},
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = { registries = { "github:Crashdummyy/mason-registry" } },
        },
    },
}
