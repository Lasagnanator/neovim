---@diagnostic disable: unused-local
local utils = require("core.utils")
local list_path = vim.fn.stdpath("config") .. "/lua/configurations/langs.lua"


--<< Generate template if missing
utils.generate_from_template("langs.lua", "Missing list file, generating new one from template")


--<< Load defaults and configuration
local default_config = require("templates.langs")
local local_config = require("configurations.langs")
local updated = false

for lang, default in pairs(default_config) do
    if local_config[lang] == nil then
        local_config[lang] = default
        updated = true
    end
end


--<< Pre-flight checks
local dependencies = require("core.langs_dependencies")
for lang, deps in pairs(dependencies) do
    if local_config[lang] == true then
        for _, dep in ipairs(deps) do
            if local_config[dep] == false then
                updated = true
                vim.notify("Dependency " .. dep .. "for " .. lang .. "not enabled, correcting.")
                local_config[dep] = true
            end
        end
    end
end


--<< Update list if something changed in the template
if updated then
    vim.notify("Found differences with template, updating language list")
    local lang_list = {}
    for lang, enabled in pairs(local_config) do
        lang_list[lang] = enabled
        -- table.insert(lang_list, lang)
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


--<< Export values
Langs = local_config or default_config
