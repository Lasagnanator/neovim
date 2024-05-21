return {
    {
        "ziontee113/icon-picker.nvim",
        opts = {
            disable_legacy_commands = true
        },
        keys = require("keybinds.plugins.iconpicker"):to_lazy(),
        cmd = {
            "IconPickerNormal",
            "IconPickerInsert",
            "IconPickerYank"
        }
    }
}
