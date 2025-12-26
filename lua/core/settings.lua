--<< SETTINGS >>--

--<< Options
local settings = {
    number = true,
    relativenumber = true,
    numberwidth = 5,
    scrolloff = 4,
    signcolumn = "yes",
    cursorline = true,
    cursorlineopt = "both",
    hlsearch = false,
    smartcase = true,
    ignorecase = true,
    autoindent = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    smarttab = false,
    foldenable = true,
    foldmethod = "expr",
    foldlevel = 99,
    foldexpr = "v:lua.vim.treesitter.foldexpr()",
    foldtext = "",
    foldcolumn = "0",
    conceallevel = 2,
    wrap = false,
    linebreak = true,
    breakindent = true,
    modeline = true,
    showmode = false,
    showtabline = 0,
    winborder = "rounded",
    termguicolors = true,
    splitbelow = true,
    splitright = true,
    undofile = true,
}

for k, v in pairs(settings) do
    vim.opt[k] = v
end

--<< Variables
vim.opt.fillchars:append({
    diff = "╱",
    fold = " ",
})

--<< Fix for missing highlight groups
-- TODO: check if still needed
vim.api.nvim_set_hl(0, "@text.emphasis", { link = "Italic" })
vim.api.nvim_set_hl(0, "@text.strong", { link = "Bold" })
