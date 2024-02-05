local utils = {}

-- TODO: find better function
utils.dump_table = function(node)
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
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = " .. tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = {\n"
                    table.insert(stack, node)
                    table.insert(stack, v)
                    cache[node] = cur_index + 1
                    break
                else
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = '" .. tostring(v) .. "'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
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


--<< KEYBINDS


--[[ NOTE: Stricter type check (not working):
     if type(keybind) == "table"
         and (type(keybind.mode) == "string" or type(keybind.mode) == "table")
         and type(keybind.map) == "string"
         and type(keybind.action) == "string"
         and (type(keybind.opts) == "table" or keybind.opts == nil)
     then
         exec...
--]]
utils.is_keybind = function(keybind)
    local result = false
    if type(keybind) == "table"
        and keybind.mode ~= nil
        and keybind.map ~= nil
        and keybind.action ~= nil
        and keybind.opts ~= nil
    then
        result = true
    end
    return result
end


-- PERF: not utilized
utils.unpack_keybind = function(keybind)
    return keybind.mode, keybind.map, keybind.action, keybind.opts
end


utils.lazy_keybinds = function(keybinds)
    local lazybinds = {}
    if type(keybinds) ~= "table" then
        return
    end
    for _, keybind in pairs(keybinds) do
        local lazybind = { keybind.map, keybind.action, mode = keybind.mode }
        for opt, value in pairs(keybind.opts) do
            lazybind[opt] = value
        end
        table.insert(lazybinds, lazybind)
    end
    return lazybinds
end


utils.index_keybinds = function(node)
    local indexed = {}
    if utils.is_keybind(node) then
        indexed = { node.mode, node.map, node.action, node.opts }
    elseif type(node) == "table" then
        for _, keybind in pairs(node) do
            table.insert(indexed, { keybind.mode, keybind.map, keybind.action, keybind.opts })
        end
    end
    return indexed
end


utils.set_keybinds = function(keybinds)
    if type(keybinds) ~= "table" then
        return
    end
    for _, keybind in pairs(keybinds) do
        if utils.is_keybind(keybind) then
            vim.keymap.set(keybind.mode, keybind.map, keybind.action, keybind.opts)
        else
            utils.set_keybinds(keybind)
        end
    end
end


utils.set_keybinds_debug = function(keybinds)
    if type(keybinds) ~= "table" then
        return
    end
    for _, keybind in pairs(keybinds) do
        if utils.is_keybind(keybind) then
            vim.keymap.set(keybind.mode, keybind.map, keybind.action, keybind.opts)
            print("Keybind set")
        else
            print("Recursing into table")
            utils.set_keybinds(keybind)
        end
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


utils.list_append = function(arg_list, arg_element)
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


utils.mason_install_missing = function(packs)
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


utils.on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    utils.set_keybinds(Keybinds.lsp(bufopts).on_attach)
end


--<< LSP


utils.exclude_client = function(client_name)
    local clients = vim.lsp.get_active_clients()
    for _, client in pairs(clients) do
        if client.name == client_name then
            vim.lsp.get_client_by_id(client.id).stop()
        end
    end
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local new_client = vim.lsp.get_client_by_id(args.data.client_id)
            if new_client.name == client_name then
                new_client.stop()
            end
        end
    })
end


utils.set_capabilities = function(overwrite)
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


return utils
