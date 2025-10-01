--<< GLOBAL VARIABLES >>--

--<< Imports
local class = require("core.classes")

--<< Variables
Colorscheme = "tokyonight"
Priority = {
    colorscheme = 1000,
    completion = 700,
    treesitter = 900,
}
Treesitter = class.Treesitter_parsers:new({
    "vim",
    "vimdoc",
    "gitcommit",
    "gitignore",
    "gitattributes",
    "git_config",
    "git_rebase",
})
Mason = class.Language_tools:new()
After = class.Delayed_execution:new()
