if Langs.terraform then
    if vim.fn.executable("tofu") then
        vim.lsp.enable("tofu_ls")
    else
        vim.lsp.enable("terraformls")
        require("lint").linters_by_ft.terraform = { "tflint" }
    end
end
