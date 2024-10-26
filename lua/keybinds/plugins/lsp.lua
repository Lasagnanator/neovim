local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local M = {}

function M.on_attach(args)
    return keys:new({
        key:new("n", "<Leader>ci", vim.diagnostic.open_float, "Open description", args),
        key:new("n", "<Leader>cr", function () return ":IncRename " end, "Rename symbol", { expr = true }),
        key:new("n", "<Leader>cd", function() vim.lsp.buf.definition({ reuse_win = true, }) end, "Goto definition", args),
        key:new("n", "<Leader>cD", function() vim.lsp.buf.declaration({ reuse_win = true, }) end, "Goto declaration", args),
        key:new("n", "<C-h>", vim.lsp.buf.hover, "Open hover", args),
        key:new("n", "<Leader>ca", function () require("actions-preview").code_actions() end, "Code actions", args),
        key:new("x", "<Leader>ca", vim.lsp.buf.range_code_action, "Code actions", args),
        key:new("n", "<Leader>cwa", vim.lsp.buf.add_workspace_folder, "Add workspace folder", args),
        key:new("n", "<Leader>cwr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder", args),
        key:new("n", "<Leader>cwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders", args),
        key:new("n", "<Leader>cf", function() require("conform").format({ async = true }) end, "Format file", args),
        key:new("n", "<Leader>cs", function() require("telescope.builtin").lsp_references({ include_current_line = true }) end, "LSP references", args),
        key:new("n", "<Leader>ch", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 }) end, "Toggle inlay hints", args),
        key:new("n", "[d", vim.diagnostic.goto_prev, "Diagnostic", args),
        key:new("n", "]d", vim.diagnostic.goto_next, "Diagnostic", args),
    })
end

return M
