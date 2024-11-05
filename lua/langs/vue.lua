if not Langs.vue.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("vue")
Mason:update("vue-language-server")
After:add(function()
    require("lspconfig").volar.setup({
        on_attach = function(_, bufnr)
            utils.exclude_client("tsserver")
            utils.on_attach(_, bufnr)
        end,
        capabilities = utils.set_capabilities(),
        root_dir = require("lspconfig").util.root_pattern("**.vue"),
        single_file_support = false,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    })
end)

return {}
