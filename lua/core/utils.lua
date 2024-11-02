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


-- TODO: docstring
function M.generate_from_template(filename, message)
    local message = message or ("Missing file, generated " .. filename)
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


--<< WSL


function M.is_wsl()
    if os.getenv("WSLENV") or os.getenv("WSL_INTEROP") or os.getenv("WSL_DISTRO_NAME") then
        return true
    else
        return false
    end
end

--<< MASON


local insert_nodups = function(arg_list, arg_element)
    local list
    if type(arg_list) == "table" then
        for _, val in pairs(arg_list) do
            if val == arg_element then
                return arg_list
            end
        end
        list = arg_list
        table.insert(list, arg_element)
    else
        list = { arg_element }
    end
    return list
end


M.update_list = function(arg_list, arg_element)
    local list = arg_list
    local element = arg_element
    if type(element) == "string" then
        list = insert_nodups(list, element)
    elseif type(element) == "table" then
        for _, unpack_elem in pairs(element) do
            list = insert_nodups(list, unpack_elem)
        end
    else
        print("Cannot add element " .. element .. " to the list")
    end
    return list
end


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


M.on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    require("keybinds.plugins.lsp").on_attach(bufopts):set()
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end


M.exclude_client = function(client_name)
    local clients = vim.lsp.get_clients()
    for _, client in pairs(clients) do
        if client.name == client_name then
            vim.lsp.get_client_by_id(client.id).stop()
        end
    end
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local new_client = vim.lsp.get_client_by_id(args.data.client_id)
            if new_client == nil then return end
            if new_client.name == client_name then
                new_client.stop()
            end
        end
    })
end


M.set_capabilities = function(overwrite)
    local overwrite_capabilities = overwrite or {}
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = {}
    local function merge_capabilities(original, merge)
        local merged = original
        for cap_key, cap_value in pairs(merge) do
            merged[cap_key] = cap_value
        end
        return merged
    end
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities = merge_capabilities(capabilities, cmp_capabilities)
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    capabilities = merge_capabilities(capabilities, overwrite_capabilities)
    return capabilities
end


return M
