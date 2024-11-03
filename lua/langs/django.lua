if not Langs.django then return {} end

local utils = require("core.utils")

if not utils.check_dependencies("django", { "python", "jinja" }) then
    return {}
end

Treesitter:update("htmldjango")
Mason:update({ "djlint" })
After:add(function()
    require("lint").linters_by_ft.htmldjango = { "djlint" }
end)


return {}