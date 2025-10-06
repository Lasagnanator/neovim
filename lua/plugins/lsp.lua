---@type LazySpec
return {
    -- NOTE: check the new way to call an LSP configuration and adapt the language modules
    "neovim/nvim-lspconfig",
    version = "*",
    config = function ()
        local utils = require("core.utils")
        require("lspconfig")
        vim.lsp.config("*", {
            on_attach = utils.on_attach,
            capabilities = utils.set_capabilities(),
        })
    end
}
