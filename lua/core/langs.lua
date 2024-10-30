local template_path = vim.fn.stdpath("config") .. "/lua/templates/langs.lua"
local list_path =vim.fn.stdpath("config") .. "/lua/configurations/langs.lua"

local r_list = io.open(list_path, "r")
if r_list == nil then
    vim.notify("Missing list file, generating new one from template.")
    local w_list = io.open(list_path, "w")
    local template = io.open(template_path, "r")
    if w_list ~= nil and template ~= nil then
        w_list:write(template:read("*a"))
        w_list:close()
        template:close()
    end
else
    r_list:close()
end

local default_config = require("templates.langs")
local local_config = require("configurations.langs")

local updated = false

for lang, default in pairs(default_config) do
    if local_config[lang] == nil then
        local_config[lang] = default
        updated = true
    end
end

if updated then
    vim.notify("Found differences with template, updating language list.")
    local lang_list = {}
    for lang, _ in pairs(local_config) do
        table.insert(lang_list, lang)
    end
    table.sort(lang_list)

    local new_list = "return {"
    for _, lang in pairs(lang_list) do
        new_list = new_list .. "\n    " .. lang .. " = " .. tostring(local_config[lang]) .. ","
    end
    new_list = new_list .. "\n}"

    local w_list = io.open(list_path, "w")
    if w_list ~= nil then
        w_list:write(new_list)
        w_list:close()
    end
end

Langs = local_config or default_config
