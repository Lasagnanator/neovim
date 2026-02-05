if Langs.yaml then
    vim.lsp.enable("yamlls")

    vim.api.nvim_create_user_command("YamlCurrentSchema", function()
        local schema = require("schema-companion").get_current_schemas()
        if schema == nil then
            print("No schema loaded")
        else
            print("Current schema: " .. schema)
        end
    end, {})
end
