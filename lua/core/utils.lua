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

-- PERF: not utilized
-- NOTE: discarded this approach since prone to errors
utils.set_keymaps_indexed = function(keybinds)
    local is_mappable = function(key_definition)
        if (type(key_definition[1]) == "string" or type(key_definition[1]) == "table")
            and type(key_definition[2]) == "string"
            and type(key_definition[3]) == "string"
            and type(key_definition[4]) == "table"
        then
            return true
        else
            return false
        end
    end
    print("Function called on " .. type(keybinds))
    if type(keybinds) ~= "table" then
        print("fail")
        return
    end
    for index, keybind in pairs(keybinds) do
        print(index)
        print(keybind)
        if is_mappable(keybind) then
            vim.keymap.set(keybind[1], keybind[2], keybind[3], keybind[4])
            print("Set keybind")
        else
            print("Recurse into table")
            utils.set_keymaps_indexed(keybind)
        end
    end
end

return utils
