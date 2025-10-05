--<< AUTOCOMMANDS >>--

--<< Vars
local autocmd = vim.api.nvim_create_autocmd

--<< Autocommands
autocmd("TextYankPost", {
    callback = function()
        vim.cmd("silent!")
        vim.highlight.on_yank({ timeout = 150 })
    end
})

autocmd("TermOpen", {
    pattern = "term://*",
    callback = function()
        vim.opt_local["number"] = false
        vim.opt_local["relativenumber"] = false
        vim.cmd("startinsert")
    end
})

autocmd("BufEnter", {
    pattern = "term://*",
    callback = function()
        vim.cmd("startinsert")
    end
})

autocmd("BufLeave", {
    pattern = "term://*",
    callback = function()
        vim.cmd("stopinsert")
    end
})
