--<< SETTINGS >>--

--<< Options
local settings = {
    number         = true,
    relativenumber = true,
    numberwidth    = 5,
    scrolloff      = 4,
    signcolumn     = "yes",
    cursorline     = true,
    cursorlineopt  = "both",
    autoindent     = true,
    expandtab      = true,
    shiftwidth     = 4,
    tabstop        = 4,
    softtabstop    = 4,
    smarttab       = false,
    foldenable     = true,
    foldmethod     = "manual",
    foldlevel      = 99,
    foldlevelstart = 99,
    conceallevel   = 2,
    wrap           = false,
    linebreak      = true,
    breakindent    = true,
    modeline       = true,
    showmode       = false,
    showtabline    = 2,
    hlsearch       = false,
    termguicolors  = true,
    splitbelow     = true,
    splitright     = true,
    undofile       = true,
}

for k, v in pairs(settings) do
    vim.opt[k] = v
end

--<< Variables
vim.opt.fillchars:append { diff = "╱" }
