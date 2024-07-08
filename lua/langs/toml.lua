if not Langs.toml then return {} end

local utils = require("core.utils")

Treesitter:update("toml")
Mason:update("taplo")

return {}
