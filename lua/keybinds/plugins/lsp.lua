local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local M = {}

function M.on_attach(args)
    return keys:new({
        key:new("n", "<Leader>ce", vim.diagnostic.open_float, "Open description", args),
        key:new("n", "<Leader>cr", vim.lsp.buf.rename, "Rename symbol", args),
        key:new("n", "<Leader>cd", function() vim.lsp.buf.definition({ reuse_win = true, }) end, "Goto definition", args),
        key:new("n", "<Leader>cD", function() vim.lsp.buf.declaration({ reuse_win = true, }) end, "Goto declaration", args),
        key:new("n", "<Leader>ci", vim.lsp.buf.hover, "Open hover", args),
        key:new("n", "<Leader>ca", vim.lsp.buf.code_action, "Code actions", args),
        key:new("n", "<Leader>cwa", vim.lsp.buf.add_workspace_folder, "Add workspace folder", args),
        key:new("n", "<Leader>cwr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder", args),
        key:new("n", "<Leader>cwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders", args),
        key:new("n", "<Leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format file", args),
        key:new("n", "<Leader>cs", function() require("telescope.builtin").lsp_references({ include_current_line = true }) end, "LSP references", args),
        key:new("n", "<Leader>ch", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 }) end, "Toggle inlay hints", args),
        key:new("n", "[e", vim.diagnostic.goto_prev, "Diagnostic", args),
        key:new("n", "]e", vim.diagnostic.goto_next, "Diagnostic", args),
    })
end

return M
