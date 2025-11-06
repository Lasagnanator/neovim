---@type LazySpec
return {
    {
        "zakissimo/smoji.nvim",
        branch = "master",
        config = function() require("smoji") end,
        keys = require("keybinds.plugins.smoji"):to_lazy(),
        cmd = { "Smoji" }
    }
}
