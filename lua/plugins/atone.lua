---@type LazySpec
return {
    "XXiaoA/atone.nvim",
    branch = "main",
    config = true,
    cmd = "Atone",
    keys = require("keybinds.plugins.atone"):to_lazy(),
}
