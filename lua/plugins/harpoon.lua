return {
    "ThePrimeagen/harpoon",
    enabled = false,
    config = function()
        require("harpoon").setup({
            global_settings = {
                enter_on_sendcmd = true
            }
        })
        require("keybinds.plugins.harpoon"):set()
        vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "TelescopeBorder" })
        vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "TelescopeNormal" })
    end,
    dependencies = { "nvim-lua/plenary.nvim" }
}
