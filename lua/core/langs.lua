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
    if default.dependencies ~= nil and
        utils.diff_list(default.dependencies, local_config[lang].dependencies)
    then
        updated = true
    end
end


--<< Update list if something changed in the template
if updated then
    vim.notify("Found differences with template, updating language list")
    local lang_list = {}
    local sorted_list = {}

    for lang, config in pairs(default_config) do
        lang_list[lang] = config
        table.insert(sorted_list, lang)
    end
    table.sort(sorted_list)

    for lang, config in pairs(lang_list) do
        config.enabled = local_config[lang].enabled or false
    end

    local updated_list = "return {\n"
    for _, lang in ipairs(sorted_list) do
        updated_list = updated_list ..
            "    " .. lang .. " = " .. "{\n" ..
            "        enabled = " .. tostring(lang_list[lang].enabled) .. ",\n"
        if lang_list[lang].dependencies ~= nil then
            updated_list = updated_list ..
                "        dependencies = { "
            for _, dep in ipairs(lang_list[lang].dependencies) do
                updated_list = updated_list .. "\"" .. dep .. "\", "
            end
            updated_list = string.sub(updated_list, 1, string.len(updated_list) - 2)
            updated_list = updated_list .. " }\n"
        end
        updated_list = updated_list .. "    },\n"
    end
    updated_list = string.sub(updated_list, 1, string.len(updated_list) - 2)
    updated_list = updated_list .. "\n}"

    local w_list = io.open(list_path, "w")
    if w_list ~= nil then
        w_list:write(updated_list)
        w_list:close()
    end
end


--<< Pre-flight checks
for lang, config in pairs(local_config) do
    if config.enabled and config.dependencies ~= nil then
        local ok = true
        for _, dep in ipairs(config.dependencies) do
            if not local_config[dep].enabled then
                ok = false
                vim.notify("Missing " .. dep .. " for " .. lang)
            end
        end
        if not ok then
            config.enabled = false
        end
    end
end


-- Export values
Langs = local_config or default_config
