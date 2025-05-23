if not Langs.ansible.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("yaml")
Mason:update("ansible-language-server")
After:add(function()
    require("lspconfig").ansiblels.setup({
        on_attach = utils.on_attach,
        capabilities = utils.set_capabilities(),
        settings = {
            ansible = {
                validation = {
                    lint = { enabled = true }
                },
            },
        },
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufRead" }, {
        pattern = { "*.yml", "*.yaml", "*.ansible" },
        callback = function(args)
            if vim.api.nvim_get_option_value("ft", { buf = args.buf }) == "yaml.ansible" then
                -- vim.cmd("TSBufDisable indent")
                vim.cmd("TSBufDisable highlight")
            end
        end
    })
end)


return {
    {
        "mfussenegger/nvim-ansible",
        ft = { "yaml", "yaml.ansible" }
    }
}
