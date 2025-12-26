--<< AUTOCOMMANDS >>--

--<< Vars
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

--<< Autocommands
autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.cmd("silent!")
        vim.highlight.on_yank({ timeout = 150 })
    end,
})

--<< Terminal
local au_teminal = augroup("terminal_buf", { clear = true })
autocmd("TermOpen", {
    desc = "Set specific options for terminal buffers",
    group = au_teminal,
    pattern = "term://*",
    callback = function()
        vim.opt_local["number"] = false
        vim.opt_local["relativenumber"] = false
        vim.cmd("startinsert")
    end,
})
autocmd("BufEnter", {
    desc = "Start insert mode when entering a terminal buffer",
    group = au_teminal,
    pattern = "term://*",
    callback = function() vim.cmd("startinsert") end,
})
autocmd("BufLeave", {
    desc = "Stop insert mode when exiting a terminal buffer",
    group = au_teminal,
    pattern = "term://*",
    callback = function() vim.cmd("stopinsert") end,
})

--<< LSP folds
autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client ~= nil then
            if client:supports_method("textDocument/foldingRange") then
                local win = vim.api.nvim_get_current_win()
                vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
            end
        end
    end,
})
