---@type LazySpec
return {
    "monaqa/dial.nvim",
    version = "*",
    config = function()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group({
            default = {
                augend.integer.alias.decimal,
                augend.integer.alias.decimal_int,
                augend.integer.alias.hex,
                augend.integer.alias.octal,
                augend.integer.alias.binary,
                augend.constant.alias.bool,
                augend.constant.alias.alpha,
                augend.constant.alias.Alpha,
                augend.semver.alias.semver,
            },
        })
    end,
    event = { "BufReadPre", "BufNewFile" },
    keys = require("keybinds.plugins.dial"):to_lazy(),
}
