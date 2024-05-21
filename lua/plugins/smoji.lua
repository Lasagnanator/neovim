return {
    {
        "zakissimo/smoji.nvim",
        config = function() require("smoji") end,
        keys = require("keybinds.plugins.smoji"):to_lazy(),
        cmd = { "Smoji" }
    }
}
