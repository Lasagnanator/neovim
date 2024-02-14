local langpath = vim.fn.stdpath("config") .. "/lua/core/"
-- local langpath = "../" -- debug path
local template_path = langpath .. "langlist_template.lua"
local list_path = langpath .. "langlist.lua"

local r_list = io.open(list_path, "r")
if r_list == nil then
    print("Missing list file, generating new one from template.")
    local w_list = io.open(list_path, "w")
    local template = io.open(template_path, "r")
    if w_list ~= nil and template ~= nil then
        w_list:write(template:read("*a"))
        w_list:close()
        template:close()
    end
    return
end

local local_config = require("core.langlist")
local default_config = require("core.langlist_template")

local updated = false

for lang, default in pairs(default_config) do
    if local_config[lang] == nil then
        local_config[lang] = default
        updated = true
    end
end

if updated then
    print("Found differences with template, updating language list.")
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

Langs = local_config
