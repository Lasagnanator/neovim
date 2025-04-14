-- PERF: delete candidate
---@type LazyPluginSpec
return {
    "smjonas/inc-rename.nvim",
    opts = {
        input_buffer_type = "dressing",
    },
    dependencies = {
        "stevearc/dressing.nvim"
    }
}
