local M = {}

---Print recursively the contents of a table in key/value pairs
---@param node table
M.dump_table = function(node)
    local cache, stack, output = {}, {}, {}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for _ in pairs(node) do -- NOTE: the original used k, v as for, changed since they were pointless
            size = size + 1
        end

        local cur_index = 1
        for k, v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then
                if (string.find(output_str, "}", output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str, "\n", output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output, output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "[" .. tostring(k) .. "]"
                else
                    key = "['" .. tostring(k) .. "']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('  ', depth) .. key .. " = " .. tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('  ', depth) .. key .. " = {\n"
                    table.insert(stack, node)
                    table.insert(stack, v)
                    cache[node] = cur_index + 1
                    break
                else
                    output_str = output_str .. string.rep('  ', depth) .. key .. " = '" .. tostring(v) .. "'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('  ', depth - 1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('  ', depth - 1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('  ', depth - 1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output, output_str)
    output_str = table.concat(output)

    print(output_str)
end


--<< General


---Compares two lists, return true if lists are different.
---Does not consider order when confronting lists.
---@param table_one any
---@param table_two any
---@return boolean
function M.diff_list(table_one, table_two)
    if table_one == nil then
        if table_two == nil then
            return true
        else
            return false
        end
    end
    local compared = {}
    for _, value in ipairs(table_one) do
        compared[value] = false
    end
    for _, value in ipairs(table_two) do
        if compared[value] ~= nil then
            compared[value] = true
        else
            return true
        end
    end
    for _, found in pairs(compared) do
        if not found then
            return true
        end
    end
    return false
end


---Generates a configuration file from a template
---@param filename string
---@param custom_message? string
function M.generate_from_template(filename, custom_message)
    local message = custom_message or ("Missing file, generated " .. filename)
    local template_path = vim.fn.stdpath("config") .. "/lua/templates/".. filename
    local configuration_path = vim.fn.stdpath("config") .. "/lua/configurations/".. filename
    local existence_check = io.open(configuration_path, "r")
    if existence_check == nil then
        vim.notify(message)
        local configuration = io.open(configuration_path, "w")
        local template = io.open(template_path, "r")
        if configuration ~= nil and template ~= nil then
            configuration:write(template:read("*a"))
            configuration:close()
            template:close()
        end
    else
        existence_check:close()
    end
end


---Checks if all language dependencies are satisfied, return true when everything is enabled
---@param current string
---@param requirements string|string[]
---@return boolean
function M.check_dependencies(current, requirements)
    local required_languages = {}
    local missing = false
    local misconfigured = false
    M.update_list(required_languages, requirements)
    for _, lang in ipairs(required_languages) do
        if type(Langs[lang]) ~= "boolean" then
            misconfigured  = true
            vim.notify("Language " .. lang .. " does not exist, abort loading " .. current)
            goto continue
        end
        if not Langs[lang] then
            missing = true
            vim.notify(lang .. " needed for " .. current)
        end
        ::continue::
    end
    if misconfigured or missing then
        return false
    else
        return true
    end
end


---Insert an element in a list if not already present
---@param list table
---@param element any
---@return table
local function insert_nodups(list, element)
    local updated_list
    if type(list) == "table" then
        for _, val in pairs(list) do
            if val == element then
                return list
            end
        end
        updated_list = list
        table.insert(updated_list, element)
    else
        updated_list = { element }
    end
    return updated_list
end


---Add a single or multiple strings to a list without inserting duplicates
---@param list table
---@param addendum string|string[]
---@return table
M.update_list = function(list, addendum)
    local updated_list = list
    if type(addendum) == "string" then
        updated_list = insert_nodups(updated_list, addendum)
    elseif type(addendum) == "table" then
        for _, element in pairs(addendum) do
            updated_list = insert_nodups(updated_list, element)
        end
    else
        print("Cannot add element " .. addendum .. " to the list")
    end
    return updated_list
end


--<< WSL


---@deprecated
---Check if inside WSL
---@return boolean
function M.is_wsl()
    if os.getenv("WSLENV") or os.getenv("WSL_INTEROP") or os.getenv("WSL_DISTRO_NAME") then
        return true
    else
        return false
    end
end


--<< MASON


---Install missing Mason packages from the delcared list
---@param packs table
M.mason_install_missing = function(packs)
    local mason = require("mason-registry")
    local install_list
    for _, pack in pairs(packs) do
        if not mason.is_installed(pack) then
            if type(install_list) ~= "nil" then
                install_list = install_list .. " " .. pack
            else
                install_list = " " .. pack
            end
        end
    end
    if type(install_list) ~= "nil" then
        vim.cmd("MasonInstall " .. install_list)
    end
end


--<< LSP


---List of instructions to run when a client connects to a buffer
---@param _ any
---@param bufnr integer
M.on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    require("keybinds.plugins.lsp").on_attach(bufopts):set()
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end


---Block a client from attaching to a buffer
---@param client_name any
M.exclude_client = function(client_name)
    local clients = vim.lsp.get_clients()
    for _, client in pairs(clients) do
        if client.name == client_name then
            vim.lsp.get_client_by_id(client.id):stop()
        end
    end
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local new_client = vim.lsp.get_client_by_id(args.data.client_id)
            if new_client == nil then return end
            if new_client.name == client_name then
                new_client:stop()
            end
        end
    })
end


---Define capabilities of a client
---@param overwrite? table
---@return table
M.set_capabilities = function(overwrite)
    local overwrite_capabilities = overwrite or {}
    -- NOTE: needed?
    -- overwrite_capabilities.textDocument.foldingRange = {
    --     dynamicRegistration = false,
    --     lineFoldingOnly = true
    -- }
    return require("blink.cmp").get_lsp_capabilities(overwrite_capabilities)
end


return M
