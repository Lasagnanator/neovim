return {
    {
        "ziontee113/icon-picker.nvim",
        opts = {
            disable_legacy_commands = true
        },
        -- TODO: move key to appropriate section
        keys = {
            { "<Leader>fi", "<Cmd>IconPickerNormal<CR>", desc = "Select icon to insert" }
        },
        cmd = {
            "IconPickerNormal",
            "IconPickerInsert",
            "IconPickerYank"
        }
    }
}
