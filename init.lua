-- Do not do anything if launched from VSCode
if vim.g.vscode then
    return
end

vim.fn.mkdir(vim.fn.stdpath("config") .. "/lua/configurations", "p")
