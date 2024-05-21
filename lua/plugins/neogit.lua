return {
    "NeogitOrg/neogit",
    config = true,
    init = function()
        require("keybinds.plugins.neogit"):set()
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
    }
}
