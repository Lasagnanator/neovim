if Langs.shell then
    vim.lsp.enable("bash_ls")
    vim.lsp.enable("awk_ls")
    vim.lsp.enable("fish_lsp")
    vim.lsp.enable("systemd_lsp")
    require("conform").formatters_by_ft.sh = { "shfmt" }
    require("conform").formatters_by_ft.bash = { "shfmt" }
end
