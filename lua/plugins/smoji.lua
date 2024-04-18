return {
    {
        "zakissimo/smoji.nvim",
        config = function() require("smoji") end,
        -- TODO: move keymap to appropriate section
        keys = {
            { "<Leader>fm", "<Cmd>Smoji<CR>", desc = "Select emoji to insert" }
        },
        cmd = { "Smoji" }
    }
}
