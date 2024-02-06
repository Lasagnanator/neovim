if not Langs.go then return {} end

local utils = require("core.utils")

Mason:update({ "gopls", "delve" })

return {
    {
        'ray-x/go.nvim',
        dependencies = { -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        -- config = function()
        --     require('go').setup()
        -- end,
        config = true,
        event = { 'CmdlineEnter' },
        ft = { 'go', 'gomod' },
        -- build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
}
