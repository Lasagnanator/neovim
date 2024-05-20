return {
    "NeogitOrg/neogit",
    -- TODO: enable with nvim 0.10
    enabled = false,
    config = true,
    init = function()
        require("keybinds.plugins.neogit"):set()
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
    }
}
