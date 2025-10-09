local key = require("core.classes").Keybind
local keys = require("core.classes").Keybinds_group
local M = {}

--WARN: disabled keybinds for which the plugin is not installed
function M.on_attach(args)
    return keys:new({
        key:new("n", "<Leader>cz", "<Cmd>LspInfo<CR>", "Open description", args),
        key:new("n", "<Leader>ci", vim.diagnostic.open_float, "Open description", args),
        -- key:new("n", "<Leader>cr", function () return ":IncRename " end, "Rename symbol", { expr = true }),
        key:new("n", "<Leader>cd", function() vim.lsp.buf.definition({ reuse_win = true }) end, "Goto definition", args),
        key:new("n", "<Leader>cD", function() vim.lsp.buf.declaration({ reuse_win = true }) end, "Goto declaration", args),
        key:new("n", "<C-h>", vim.lsp.buf.hover, "Open hover", args),
        key:new("n", "<Leader>ca", vim.lsp.buf.code_action, "Code actions", args),
        key:new("x", "<Leader>ca", vim.lsp.buf.range_code_action, "Code actions", args),
        key:new("n", "<Leader>cf", function() require("conform").format({ async = true }) end, "Format file", args),
        key:new("n", "<Leader>cs", function() require("fzf-lua").lsp_references() end, "LSP references", args),
        key:new("n", "<Leader>ch",
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 }) end,
            "Toggle inlay hints", args),
        key:new("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Diagnostic", args),
        key:new("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Diagnostic", args),
    })
end

return M
