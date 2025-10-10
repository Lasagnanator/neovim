if not Langs.toml then
    return {}
end

Treesitter:update("toml")
Mason:update("taplo")
vim.lsp.enable("taplo")

return {}
