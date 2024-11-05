if not Langs.django.enabled then return {} end

local utils = require("core.utils")

Treesitter:update("htmldjango")
Mason:update({ "djlint" })
After:add(function()
    require("lint").linters_by_ft.htmldjango = { "djlint" }
end)


return {}
