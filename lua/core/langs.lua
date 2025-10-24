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

--<< Dependencies and tools management
local properties = require("core.langs_properties")
local disaligned = false
for lang, props in pairs(properties) do
    if local_config[lang] == true then
        if props.dependencies ~= nil then
            for _, dep in ipairs(props.dependencies) do
                if local_config[dep] == false then
                    disaligned = true
                    vim.notify("Dependency " .. dep .. " for " .. lang .. " not enabled, fixing configuration.")
                    local_config[dep] = true
                end
            end
        end
        if props.mason ~= nil then Mason:update(props.mason) end
        if props.treesitter ~= nil then Treesitter:update(props.treesitter) end
    end
end

--<< Update list if something changed in the template
if updated or disaligned then
    if updated then vim.notify("Found differences with template, updating language list") end
    local lang_list = {}
    local sorted_list = {}
    for lang, enabled in pairs(local_config) do
        lang_list[lang] = enabled
        table.insert(sorted_list, lang)
    end
    table.sort(sorted_list)

    local tostring_list = "return {"
    for _, lang in ipairs(sorted_list) do
        tostring_list = tostring_list .. "\n    " .. lang .. " = " .. tostring(lang_list[lang]) .. ","
    end
    tostring_list = tostring_list .. "\n}"

    local w_list = io.open(list_path, "w")
    if w_list ~= nil then
        w_list:write(tostring_list)
        w_list:close()
    end
end

--<< Export values
Langs = local_config or default_config
