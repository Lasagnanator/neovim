if not Langs.flutter then return {} end

---@type LazySpec
return {
    "nvim-flutter/flutter-tools.nvim",
    opts = {
        fvm = true,
        decoration = {
            statusline = {
                -- TODO: configure lualine with this fields
                app_version = true,
                device = true,
            },
        },
        debugger = {
            enabled = true,
        },
        -- TODO: test
        widget_guides = {
            enabled = true,
        },
        settings = {
            showTodos = false,
        },
    },
    ft = "dart",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
