if not Langs.ruby then return {} end

return {
    "suketa/nvim-dap-ruby",
    branch = "main",
    config = true,
    dependencies = { "mfussenegger/nvim-dap" },
}
