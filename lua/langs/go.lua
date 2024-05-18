if not Langs.go then return {} end

local utils = require("core.utils")

Treesitter:update({ "go", "gomod", "gosum", "gotmpl", "gowork" })
Mason:update({ "gopls", "delve" })

require("lspconfig").gopls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.set_capabilities(),
})

return {
    {
        'ray-x/go.nvim',
        dependencies = { -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = true,
        event = { 'CmdlineEnter' },
        ft = { 'go', 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
}
