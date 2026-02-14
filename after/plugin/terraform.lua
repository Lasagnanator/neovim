if Langs.terraform then
    vim.lsp.enable("terraformls")
    require("lint").linters_by_ft.terraform = { "tflint" }
end
