---@type LazySpec
return {
    "nvim-mini/mini.icons",
    version = "*",
    opts = {
        style = "glyph",
    },
    config = function (_, opts)
        local mi = require("mini.icons")
        mi.setup(opts)
        mi.mock_nvim_web_devicons()
    end,
    event = "VeryLazy",
}
