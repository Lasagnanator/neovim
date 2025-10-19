--<< GLOBAL VARIABLES >>--

local class = require("core.classes")
local utils = require("core.utils")

--<< Constants
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

--<< Generate and require variables
utils.generate_from_template("globals.lua", "Missing global variables file, generating new one with default values")
require("configurations.globals")
