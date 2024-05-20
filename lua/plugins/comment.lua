return {
    "numToStr/Comment.nvim",     -- Easier commenting
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        padding = true,     -- Add a space b/w comment and the line
        sticky = true,      -- Whether the cursor should stay at its position
        ignore = nil,       -- Lines to be ignored while (un)comment
        -- toggler = Keybinds.comment().toggler,
        -- opleader = Keybinds.comment().opleader,
        -- extra = Keybinds.comment().extra,
        -- Enable keybindings
        -- NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            basic = true,     -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            -- extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
        },
        pre_hook = nil,      -- Function to call before (un)comment
        post_hook = nil,     -- Function to call after (un)comment
    }
}
